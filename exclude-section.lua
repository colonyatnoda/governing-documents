function Pandoc(doc)
    -- Ensure there is at least one block in the document
    if #doc.blocks > 0 then
        -- Remove the second block (which is the metadata section)
        table.remove(doc.blocks, 2)
    end

    -- Insert the disclaimer at the beginning of the document
    local note = pandoc.Para({
        pandoc.Str("NOTE: These are not the original governing documents, but are generated from transcriptions that may contain errors or slight changes for readability.")
    })
    table.insert(doc.blocks, 1, note)

    return doc
end
