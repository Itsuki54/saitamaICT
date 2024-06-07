use crate::{Block, Expr};

/// A part of block code.
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Statement {
    /// See [`Assign`].
    Assign(Assign),

    /// See [`Change`].
    Change(Change),

    /// 1. Evaluate `expr`.
    /// 2. Set the result of 1 to (`scope`, `ptr`).
    Return(Option<Expr>),

    /// See [`Conditional`].
    Conditional(Conditional),

    /// See [`Call`].
    Call(Call),

    /// See [`Map`].
    Map(Map),

    /// See [`Loop`].
    Loop(Loop),
}

/// 1. Evaluate `expr`.
/// 2. Set the result of 1. to (`scope`, `ptr`).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Assign {
    pub scope: u64,
    pub ptr: u64,
    pub expr: Expr,
}

/// 1. Evaluate `expr`.
/// 2. Change the value of (`scope`, `ptr`) to the result of 1.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Change {
    pub scope: u64,
    pub ptr: u64,
    pub expr: Expr,
}

/// 1. Evaluate `condidion`.
/// 2. If the result of 1. is true, do `then_block`.
/// 3. Else, if `else_block` is not `None`, do item of `else_block`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Conditional {
    pub condition: Expr,
    pub then_block: Block,
    pub else_block: Option<Block>,
}

/// 1. Evaluate `expr`.
/// 2. For each `i` in `0..args.len()`, evaluate args\[i\].
/// 3. Do the block of the result of 1. with the results of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Call {
    pub expr: Expr,
    pub args: &'static [Expr],
}

/// 1. Evaluate `iterable`.
/// 2. Evaluate `function`.
/// 3. Let `l` be the length of the result of 1.
/// 4. Switch the length of the arguments of `function`.
///    - 0: For each `i` in `0..l`, do the block of `function`.
///    - 1: For each `i` in `0..l`, do the block of `function` with index `i` of the result of 2.
///    - 2: For each `i` in `0..l`, do the block of `function` with index `i` of the result of 2, and `i`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Map {
    pub iterable: Expr,
    pub function: Expr,
}

/// Until Break:
/// 1. Evaluate `condition`.
/// 2. If the result of 1. is not true, break.
/// 3. Do `block`.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Loop {
    pub condition: Expr,
    pub block: Block,
}
