// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:metrics_center/src/common.dart';
import 'package:metrics_center/src/constants.dart';
import 'package:metrics_center/src/google_benchmark.dart';

import 'common.dart';
import 'utility.dart';

void main() {
  test('GoogleBenchmarkParser parses example json.', () async {
    final List<MetricPoint> points =
        await GoogleBenchmarkParser.parse('test/example_google_benchmark.json');
    expect(points.length, 6);
    expectSetMatch(
      points.map((MetricPoint p) => p.value),
      <int>[101, 101, 4460, 4460, 6548, 6548],
    );
    expectSetMatch(
      points.map((MetricPoint p) => p.tags[kSubResultKey]),
      <String>[
        'cpu_time',
        'real_time',
        'cpu_coefficient',
        'real_coefficient',
      ],
    );
    expectSetMatch(
      points.map((MetricPoint p) => p.tags[kNameKey]),
      <String>[
        'BM_PaintRecordInit',
        'SkParagraphFixture/ShortLayout',
        'SkParagraphFixture/TextBigO_BigO',
      ],
    );
  });
}
