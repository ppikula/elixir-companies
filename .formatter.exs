# This file is synced with beam-community/common-config. Any changes will be overwritten.

[
  import_deps: [:phoenix, :plug],
  inputs: ["*.{heex,ex,exs}", "{config,lib,priv,test}/**/*.{heex,ex,exs}"],
  line_length: 120,
  plugins: [Phoenix.LiveView.HTMLFormatter]
]
