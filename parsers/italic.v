module parsers

/**
 * Parse italics in Markdown text
 * 
 * @requires parse_bold to run first if text is both bold & italic
 */
pub fn parse_italic(text string) string {
	mut s := text

	mut aft := s
	mut brac := aft.index('*') or { -1 }
	for brac != -1 {
		aft = s
		mut t := aft.substr(brac+1, aft.len)
		if t != ' ' {
			mut endi := t.index('*') or {-1}
			if endi != -1 {
				s = aft.substr(0, brac) + '<em>' + t.substr(0,endi) + '</em>' + t.substr(endi+1, t.len)
			}
		}
		aft = s
		brac = aft.index('*') or { -1 }
	}

	aft = s
	brac = aft.index('_') or { -1 }
	for brac != -1 {
		aft = s
		mut t := aft.substr(brac+1, aft.len)
		if t != ' ' {
			mut endi := t.index('_') or {-1}
			if endi != -1 {
				s = aft.substr(0, brac) + '<em>' + t.substr(0,endi) + '</em>' + t.substr(endi+1, t.len)
			}
		}
		aft = s
		brac = aft.index('_') or { -1 }
	}

	return s
}