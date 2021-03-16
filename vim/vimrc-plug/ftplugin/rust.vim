let b:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let b:ale_linters = ['analyzer', 'rls', 'cargo']
let b:ale_fixers = ['rustfmt']

