pub mod expr;
pub mod stmt;
pub mod types;

pub use expr::Expr;
pub use stmt::Statement;
pub use types::Type;

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Block {
    pub code: &'static [Statement],
    pub symbols: &'static [Type],
}
