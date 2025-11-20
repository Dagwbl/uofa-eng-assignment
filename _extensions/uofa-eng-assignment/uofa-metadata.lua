-- uofa-metadata.lua
-- Inject student metadata into LaTeX header

function Meta(meta)
  if FORMAT:match 'latex' then
    local header = pandoc.MetaBlocks({})
    
    -- Build LaTeX commands for student metadata
    local latex_commands = {}
    
    if meta['student-name'] then
      table.insert(latex_commands, '\\studentname{' .. pandoc.utils.stringify(meta['student-name']) .. '}')
    end
    
    if meta['student-id'] then
      table.insert(latex_commands, '\\studentid{' .. pandoc.utils.stringify(meta['student-id']) .. '}')
    end
    
    if meta['course'] then
      table.insert(latex_commands, '\\course{' .. pandoc.utils.stringify(meta['course']) .. '}')
    end
    
    if meta['assignment'] then
      table.insert(latex_commands, '\\assignment{' .. pandoc.utils.stringify(meta['assignment']) .. '}')
    end
    
    if #latex_commands > 0 then
      local latex_block = pandoc.RawBlock('latex', table.concat(latex_commands, '\n'))
      
      -- Add to header-includes
      if meta['header-includes'] then
        if meta['header-includes'].t == 'MetaList' then
          table.insert(meta['header-includes'], pandoc.MetaBlocks({latex_block}))
        else
          meta['header-includes'] = pandoc.MetaList({
            meta['header-includes'],
            pandoc.MetaBlocks({latex_block})
          })
        end
      else
        meta['header-includes'] = pandoc.MetaBlocks({latex_block})
      end
    end
  end
  
  return meta
end
