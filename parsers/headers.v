module parsers

/**
 * Markdown header support
 */
pub fn parse_headers(text string) string {
	mut s := text

	if s.starts_with('###### '){ s = '<h6>' + s.substr(7,s.len) + '</h6>' }
	if s.starts_with('##### ') { s = '<h5>' + s.substr(6,s.len) + '</h5>' }
	if s.starts_with('#### ')  { s = '<h4>' + s.substr(5,s.len) + '</h4>' }
	if s.starts_with('### ')   { s = '<h3>' + s.substr(4,s.len) + '</h3>' }
	if s.starts_with('## ')    { s = '<h2>' + s.substr(3,s.len) + '</h2>' }
	if s.starts_with('# ')     { s = '<h1>' + s.substr(2,s.len) + '</h1>' }

	return s
}