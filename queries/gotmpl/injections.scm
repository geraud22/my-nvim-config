;; Inject HTML into the text parts of the Go template
((text) @injection.content
 (#set! injection.language "html")
 (#set! injection.combined))
