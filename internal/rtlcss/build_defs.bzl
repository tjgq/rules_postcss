# Copyright 2019 The Bazel Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Build rule for using rtlcss to postprocess CSS."""

load("@build_bazel_rules_postcss//internal:binary.bzl", "postcss_binary")

def rtlcss(
        name,
        src,
        out,
        **kwargs):
    """Runs rtlcss on the given source files located in the given fileset.

    Args:
        name: A unique label for this rule.
        src: Source file or target.
        out: Output file.
        **kwargs: Additional arguments to pass to postcss_binary().
    """

    postcss_binary(
        name = name,
        plugins = {
            "@build_bazel_rules_postcss//internal/rtlcss:rtlcss": "",
        },
        src = src,
        output_name = out,
        **kwargs
    )
