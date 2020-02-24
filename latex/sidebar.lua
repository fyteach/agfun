-- https://github.com/jgm/pandoc/issues/2106#issuecomment-371355862
function Span(el)
  if el.classes:includes("todo") then
    return {
      pandoc.RawInline("latex", "\\textcolor{red}{\\textbf{TODO: }"),
      el,
      pandoc.RawInline("latex", "}")
    }
  end
end

function Div(el)
  if el.classes:includes("rmdthink") then
    return {
      pandoc.RawBlock("latex", "\\begin{rmdthink}"),
      el,
      pandoc.RawBlock("latex", "\\end{rmdthink}")
    }
  end
  if el.classes:includes("rmdnote") then
    return {
      pandoc.RawBlock("latex", "\\begin{rmdnote}"),
      el,
      pandoc.RawBlock("latex", "\\end{rmdnote}")
    }
  end
  if el.classes:includes("rmdtip") then
    return {
      pandoc.RawBlock("latex", "\\begin{rmdtip}"),
      el,
      pandoc.RawBlock("latex", "\\end{rmdtip}")
    }
  end
  if el.classes:includes("twocols") then
    return {
      pandoc.RawBlock("latex", "\\begin{multicols}{2}"),
      el,
      pandoc.RawBlock("latex", "\\end{multicols}")
    }
  end
--   if el.classes:includes("remark") then
--     return {
--       pandoc.RawBlock("latex", "\\begin{remark}"),
--       el,
--       pandoc.RawBlock("latex", "\\end{remark}")
--     }
--   end
--   if el.classes:includes("introduction") then
--     return {
--       pandoc.RawBlock("latex", "\\begin{introduction}"),
--       el,
--       pandoc.RawBlock("latex", "\\end{introduction}")
--     }
--   end
end
