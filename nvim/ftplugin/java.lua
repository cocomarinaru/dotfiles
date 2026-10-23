-- Runs for every Java buffer. Starts jdtls (or attaches to the running one)
-- through nvim-jdtls, which adds test running, refactorings and debugging on
-- top of the plain LSP features. jdtls, java-debug-adapter and java-test are
-- installed by Mason (see SECTION 6 of init.lua).

local jdtls = require 'jdtls'
local mason = vim.fn.stdpath 'data' .. '/mason'

-- Project root: the nearest folder upwards that contains one of these.
local root_dir = vim.fs.root(0, { 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', '.git' })
if not root_dir then return end

-- One jdtls workspace (index, caches) per project, named after the project folder.
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.stdpath 'cache' .. '/jdtls/workspace/' .. project_name

-- Debugger and test-runner jars, loaded into jdtls as plugins.
-- Two jars shipped with java-test are not plugins and break loading, so they are skipped.
local bundles = vim.fn.glob(mason .. '/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', false, true)
for _, jar in ipairs(vim.fn.glob(mason .. '/packages/java-test/extension/server/*.jar', false, true)) do
  local skip = jar:match 'com.microsoft.java.test.runner%-jar%-with%-dependencies.jar$' or jar:match 'jacocoagent.jar$'
  if not skip then table.insert(bundles, jar) end
end

jdtls.start_or_attach {
  cmd = {
    mason .. '/bin/jdtls',
    -- Lombok as a Java agent so generated getters, setters, builders and
    -- @Slf4j loggers are visible instead of reported as errors.
    '--jvm-arg=-javaagent:' .. mason .. '/packages/jdtls/lombok.jar',
    '-data',
    workspace_dir,
  },
  root_dir = root_dir,
  init_options = { bundles = bundles },
  on_attach = function(_, bufnr)
    -- Register the Java debug adapter and discover main classes for launch configs
    jdtls.setup_dap { hotcodereplace = 'auto' }
    require('jdtls.dap').setup_dap_main_class_configs()

    local function map(mode, keys, func, desc) vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Java: ' .. desc }) end

    -- Tests run through the debug adapter, so breakpoints are hit during a run
    map('n', '<leader>jt', jdtls.test_nearest_method, '[T]est method under cursor')
    map('n', '<leader>jT', jdtls.test_class, '[T]est whole class')

    map('n', '<leader>jo', jdtls.organize_imports, '[O]rganize imports')
    map('n', '<leader>jv', jdtls.extract_variable, 'extract [V]ariable')
    map('v', '<leader>jv', function() jdtls.extract_variable(true) end, 'extract [V]ariable')
    map('n', '<leader>jc', jdtls.extract_constant, 'extract [C]onstant')
    map('v', '<leader>jc', function() jdtls.extract_constant(true) end, 'extract [C]onstant')
    map('v', '<leader>jm', function() jdtls.extract_method(true) end, 'extract [M]ethod')
  end,
}
