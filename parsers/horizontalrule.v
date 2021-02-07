module parsers

/**
 * Parse Markdown Horizontal Rules
 */
pub fn parse_hr(text string, before string, after string) string {
	if before.trim(' ') == '' && after.trim(' ') == '' {
		if text.starts_with('---') || text.starts_with('___') ||  text.starts_with('***') {
			return '<hr>'
		}
	}
	return text
}