// Copyright (c) 2016, kulshekhar. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:js';
import 'dart:html';

const _idom = 'IncrementalDOM';

/// Functions passed to [patch] must have this signature
///
typedef PatchFunction(dynamic data);

/// Declares an Element with zero or more attributes/properties that should
/// be present at the current location in the document tree.
///
Element elementOpen(String tagName,
    [String key, List staticPropertyValuePairs, Map propertyValuePairs]) {
  //
  return context[_idom].callMethod('elementOpen', [
    tagName,
    key,
    staticPropertyValuePairs,
    propertyValuePairs,
  ]);
}

/// Used with [attr] and [elementOpenEnd] to declare an element.
///
void elementOpenStart(String tagName,
    [String key, List staticPropertyValuePairs]) {
  //
  context[_idom].callMethod('elementOpenStart', [
    tagName,
    key,
    staticPropertyValuePairs,
  ]);
}

/// Used with [elementOpenStart] and [elementOpenEnd] to declare an element.
///
void attr(String name, dynamic value) {
  context[_idom].callMethod('attr', [name, value]);
}

/// Used with [elementOpenStart] and [attr] to declare an element.
///
Element elementOpenEnd() => context[_idom].callMethod('elementOpenEnd', []);

/// Signifies the end of the element opened with [elementOpen], corresponding to
/// a closing tag (e.g. </div> in HTML). Any childNodes of the currently open
/// Element that are in the DOM that have not been encountered in the current
/// render pass are removed by the call to elementClose.
///
Element elementClose(String tagName) =>
    context[_idom].callMethod('elementClose', [tagName]);

/// A combination of [elementOpen], followed by [elementClose]
///
Element elementVoid(String tagName,
    [String key, List staticPropertyValuePairs, Map propertyValuePairs]) {
  //
  return context[_idom].callMethod('elementVoid', [
    tagName,
    key,
    staticPropertyValuePairs,
    propertyValuePairs,
  ]);
}

/// Declares a Text node, with the specified text, should appear at the current
/// location in the document tree.
///
Text text(dynamic value, [List<Function> formatters]) =>
    context[_idom].callMethod('text', [value]..addAll(formatters ?? []));

/// Updates the provided Node with a function containing zero or more calls to
/// [elementOpen], [text] and [elementClose]. The provided callback function
/// may call other such functions. The [patch] function may be called with a
/// new Node while a call to patch is already executing.
///
void patch(Node node, PatchFunction f, [data]) {
  context[_idom].callMethod('patch', [node, f, data ?? {}]);
  // context[_idom].callMethod('patch', [node, f, new JsObject.jsify(data ?? {})]);
}
