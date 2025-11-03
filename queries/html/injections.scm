;; Inject JavaScript inside script tags
((script_element
  (start_tag
    (tag_name) @tag-name
    (#eq? @tag-name "script")
    (attribute
      (attribute_name) @attr-name
      (quoted_attribute_value) @attr-value
      (#any-of? @attr-name "type" "language")
      (#match? @attr-value "javascript" "text/javascript"))?
    )
  (raw_text) @injection.content)
 (#set! injection.language "javascript"))
