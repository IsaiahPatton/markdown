module parsers

/**
 * TODO
 */
pub fn parse_bold(text string) string {
	mut s := text

	mut aft := s
	mut brac := aft.index('**') or { -1 }
	for brac != -1 {
		aft = s
		mut t := aft.substr(brac+2, aft.len)
		println(t)
		if t != ' ' {
			mut endi := t.index('**') or {-1}
			if endi != -1 {
				mut tobold := t.substr(0,endi)
				mut after  := t.substr(endi+2, t.len)
				mut before := aft.substr(0, brac)
				s = before + '<b>' + tobold + '</b>' + after
			}
		}
		aft = s
		brac = aft.index('**') or { -1 }
	}

	aft = s
	brac = aft.index('__') or { -1 }
	for brac != -1 {
		aft = s
		mut t := aft.substr(brac+2, aft.len)
		println(t)
		if t != ' ' {
			mut endi := t.index('__') or {-1}
			if endi != -1 {
				mut tobold := t.substr(0,endi)
				mut after  := t.substr(endi+2, t.len)
				mut before := aft.substr(0, brac)
				s = before + '<b>' + tobold + '</b>' + after
			}
		}
		aft = s
		brac = aft.index('__') or { -1 }
	}

	return s
}