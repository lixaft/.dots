; extends

((expression_statement
   (string (string_content) @injection.content))
 (#set! injection.language "rst"))

((comment) @injection.content
 (#lua-match? @injection.content "^#: ")
 (#offset! @injection.content 0 3 0 0)
 (#set! injection.language "rst"))

(call
  function: (attribute
    attribute: (identifier) @_attr)
  arguments: (argument_list
    .
    (string
      (string_content) @injection.content))
  (#eq? @_attr "setStyleSheet")
  (#set! injection.language "css"))

(call
  function: (attribute
    attribute: (identifier) @_attr)
  arguments: (argument_list
    .
    (string
      (string_content) @injection.content))
  (#eq? @_attr "setStyleSheet")
  (#set! injection.language "css"))

(assignment
  left: (identifier) @_attr
  right: (string (string_content) @injection.content)
  (#eq? @_attr "css")
  (#set! injection.language "css"))

(assignment
  left: (identifier) @_attr
  right: (string (string_content) @injection.content)
  (#eq? @_attr "sql")
  (#set! injection.language "sql"))

(assignment
  left: (identifier) @_attr
  right: (string (string_content) @injection.content)
  (#eq? @_attr "sql")
  (#set! injection.language "sql"))

(call
  function: (attribute attribute: (identifier) @_attr)
  arguments: (argument_list (string (string_content) @injection.content))
  (#eq? @_attr "SQL")
  (#set! injection.language "sql"))

(call
  function: (identifier) @_attr
  arguments: (argument_list (string (string_content) @injection.content))
  (#eq? @_attr "SQL")
  (#set! injection.language "sql"))
