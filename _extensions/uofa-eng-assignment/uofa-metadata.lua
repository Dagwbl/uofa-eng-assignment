-- uofa-metadata.lua
-- Inject student metadata into LaTeX header
-- This Lua filter processes YAML metadata and converts it to LaTeX commands

function Meta(meta)
  -- Only process if output format is LaTeX (PDF)
  if FORMAT:match 'latex' then
    local header = pandoc.MetaBlocks({})
    
    -- Build LaTeX commands for student metadata
    local latex_commands = {}
    
    -- -------------------------------------------------------------------------
    -- STUDENT NAME
    -- -------------------------------------------------------------------------
    -- Use 'author' field if 'student-name' is not provided
    -- This allows compatibility with standard Quarto documents
    if meta['student-name'] then
      table.insert(latex_commands, '\\studentname{' .. pandoc.utils.stringify(meta['student-name']) .. '}')
    elseif meta['author'] then
      table.insert(latex_commands, '\\studentname{' .. pandoc.utils.stringify(meta['author']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- STUDENT ID
    -- -------------------------------------------------------------------------
    if meta['student-id'] then
      table.insert(latex_commands, '\\studentid{' .. pandoc.utils.stringify(meta['student-id']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- COURSE
    -- -------------------------------------------------------------------------
    if meta['course'] then
      table.insert(latex_commands, '\\course{' .. pandoc.utils.stringify(meta['course']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- ASSIGNMENT
    -- -------------------------------------------------------------------------
    if meta['assignment'] then
      table.insert(latex_commands, '\\assignment{' .. pandoc.utils.stringify(meta['assignment']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- DATE (OPTIONAL)
    -- -------------------------------------------------------------------------
    -- Add date field if provided
    if meta['date'] then
      table.insert(latex_commands, '\\date{' .. pandoc.utils.stringify(meta['date']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- CUSTOM LOGO PATH (OPTIONAL)
    -- -------------------------------------------------------------------------
    -- Allow users to specify a custom logo path from YAML
    -- If not provided, the default logo will be used
    -- Example in YAML: logo: "path/to/my/logo.png"
    if meta['logo'] then
      table.insert(latex_commands, '\\logopath{' .. pandoc.utils.stringify(meta['logo']) .. '}')
    end
    
    -- -------------------------------------------------------------------------
    -- INJECT LATEX COMMANDS INTO DOCUMENT HEADER
    -- -------------------------------------------------------------------------
    -- Only proceed if we have commands to inject
    if #latex_commands > 0 then
      -- Create a raw LaTeX block with all commands
      local latex_block = pandoc.RawBlock('latex', table.concat(latex_commands, '\n'))
      
      -- Add to header-includes metadata field
      -- This ensures the commands are executed before \maketitle
      if meta['header-includes'] then
        -- If header-includes already exists
        if meta['header-includes'].t == 'MetaList' then
          -- It's a list, append to it
          table.insert(meta['header-includes'], pandoc.MetaBlocks({latex_block}))
        else
          -- It's a single item, convert to list
          meta['header-includes'] = pandoc.MetaList({
            meta['header-includes'],
            pandoc.MetaBlocks({latex_block})
          })
        end
      else
        -- header-includes doesn't exist, create it
        meta['header-includes'] = pandoc.MetaBlocks({latex_block})
      end
    end
  end
  
  return meta
end
