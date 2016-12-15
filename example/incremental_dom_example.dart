// Copyright (c) 2016, kulshekhar. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:incremental_dom/incremental_dom.dart';

main() {
  final d1 = new Data('data 1', true);
  final d2 = new Data('data 2', true);

  final parent = document.getElementById('output');

  patch(parent, (data) {
    render(data);
  }, d1);

  // or
  patch(parent, render, d1);

  // Alternatively
  patch(parent, (_) {
    render(d2);
  });
}

render(Data data) {
  elementVoid('input', '', ['type', 'text']);

  elementOpen('div', '', null);
  if (data.isDone) {
    text(data.text);
  }
  elementClose('div');
}

class Data {
  String text = 'default text';
  bool isDone = false;

  Data([this.text, this.isDone]);
}
