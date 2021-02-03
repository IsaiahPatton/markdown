module parsers

/**
 * Parse a Markdown link with image into HTML
 */
pub fn parse_imagelink(text string) string {
	mut s := text
	mut aft := s
	mut brac := aft.index('[![') or { -1 }
	for brac != -1 {
		aft = s
		if brac != -1 {
			mut endbrac := aft.index(']') or { -1} 
			if endbrac != -1 {
				mut title := aft.substr(brac+3, endbrac)
				mut startpr := aft.index('(') or {-1}
				mut endpr := aft.index(')') or {-1}
				if startpr != -1 && endpr != -1 {
					mut link := s.substr(startpr+1, endpr)
					mut start := s.substr(0, brac)
					mut end   := s.substr(endpr+1, s.len)
					mut e     := end.substr(2, end.len)
					end = end.substr(0, end.len - e.len - 2)
					mut ebrac := e.index(')') or {-1}
					e = e.substr(0, ebrac)
					s = start + '<a href="' + e + '"><img src="' + link + '" alt="' + title +'">' + end + '</a>'
				}
			}
		}
		aft = s
		brac = aft.index('[![') or { -1 }
	}
	return s
}