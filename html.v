/*
 * Markdown parser for V
 *
 * Copyright (c) 2021 Vlang
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
module markdown

import parsers

pub fn array_to_html(input []string) string {
	mut ret := ''
	for i, str in input {
		if i == 0 {
			if input.len > 1 {
				ret += parse(str, 'nul', input[i+1]) + '\n'
			} else {
				ret += parse(str, 'nul', 'nul')
			}
		} else if i+1 >= input.len {
			ret += parse(str, input[i-1], "nul") + '\n'
		} else {
			ret += parse(str, input[i-1], input[i+1]) + '\n'
		}
	}
	return ret
}

pub fn to_html(input ...string) string {
	mut ret := ''
	for i, str in input {
		if i == 0 {
			if input.len > 1 {
				ret += parse(str, 'nul', input[i+1])
			} else  {
				ret += parse(str, 'nul', 'nul')
			}
		} else if i+1 >= input.len {
			ret += parse(str, input[i-1], "nul")
		} else {
			ret += parse(str, input[i-1], input[i+1])
		}
	}
	return ret
}

fn parse(str string, before string, after string) string {
	mut s := str
	println(before + '/' + after)

	if s.len <= 0 { return "<br>" } // TODO: better support markdown new line

	s = parsers.parse_hr(s, before, after)
	s = parsers.parse_headers(s)
	s = parsers.parse_imagelink(s)
	s = parsers.parse_image(s)
	s = parsers.parse_links(s)
	s = parsers.parse_bold(s)
	s = parsers.parse_italic(s)
	return s
}