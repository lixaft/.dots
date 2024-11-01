; extends

((expression_statement
   (string (string_content) @injection.content))
 (#set! injection.language "rst"))

((comment) @injection.content
 (#lua-match? @injection.content "^#: ")
 (#offset! @injection.content 0 3 0 0)
 (#set! injection.language "rst"))

(assignment
  left: (identifier) @injection.language
  right: (string (string_content) @injection.content)
  (#gsub! @injection.language ".*_" ""))
