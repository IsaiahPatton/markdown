/*
 * Varkdown - Markdown parser for V
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

fn test_to_html() {
	// 
	// Test Header
	// 
	mut text := '# Hello World!'
	mut result := to_html(text)
	assert result == '<h1>Hello World!</h1>'

	// 
	// Test Linkimage
	// 
	text = '[![url alt text](https://example.com/image.png)](http://vlang.io/)'
	result = to_html(text)
	assert result == '<a href="http://vlang.io/"><img src="https://example.com/image.png" alt="url alt text"></a>'

	//
	// Test Link
	//
	text = '[vlang.io](https://vlang.io)'
	result = to_html(text)
	assert result == '<a href="https://vlang.io">vlang.io</a>'

	// 
	// Test Image
	//
	text = '![vlogo](https://avatars.githubusercontent.com/u/46413578?s=64&v=4)'
	result = to_html(text)
	assert result == '<img src="https://avatars.githubusercontent.com/u/46413578?s=64&v=4" alt="vlogo">'

	//
	// Test Bold
	// 
	text = '__This is bold__ **Also bold** This is not'
	result = to_html(text)
	assert result == '<b>This is bold</b> <b>Also bold</b> This is not'

	//
	// Test Italic
	//
	text = '_This is Italic_ *So is this* But this is not'
	result = to_html(text)
	assert result == '<em>This is Italic</em> <em>So is this</em> But this is not'
}

fn test_to_plain() {
	// TODO
}