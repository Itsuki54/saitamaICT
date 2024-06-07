use crate::Block;

/// An expression.
#[derive(Copy, Clone, Debug, PartialEq)]
pub enum Expr {
    Fn(&'static Block),

    Bool(bool),
    I32(NumFlag, i32),
    U32(NumFlag, u64),
    I64(NumFlag, i32),
    U64(NumFlag, u64),
    Float(f32),
    Double(f64),

    ViewRange(&'static ViewRange),

    /// 1. For each `i` in `0..self.len()`, evaluate `self[i]`.
    /// 2. Let the result be array of the results of 1.
    Array(&'static [Expr]),

    /// See [`Conditional`].
    Conditional(NumFlag, &'static Conditional),

    /// See [`Call`].
    Call(NumFlag, &'static Call),

    /// See [`Map`].
    Map(&'static Map),

    /// See [`Reference`].
    Reference(NumFlag, &'static Reference),

    /// 1. For each `i` in `0..self.len()`:
    ///    1. Evaluate args\[i\].
    ///    2. If the result of 1. is not true:
    ///       1. Let the result be false.
    ///       2. End this evaluation.
    /// 2. Let the result be true.
    And(bool, &'static [Expr]),

    /// 1. For each `i` in `0..self.len()`:
    ///    1. Evaluate args\[i\].
    ///    2. If the result of 1. is true:
    ///       1. Let the result be true.
    ///       2. End this evaluation.
    /// 2. Let the result be false.
    Or(bool, &'static [Expr]),

    /// See [`BitAnd`].
    BitAnd(NumFlag, &'static BitAnd),

    /// See [`BitOr`].
    BitOr(NumFlag, &'static BitOr),

    /// See [`BitXor`].
    BitXor(NumFlag, &'static BitXor),

    /// See [`Shl`].
    Shl(NumFlag, &'static Shl),

    /// See [`Shr`].
    Shr(NumFlag, &'static Shr),

    /// See [`Add`].
    Add(NumFlag, &'static Add),

    /// See [`Mul`].
    Mul(NumFlag, &'static Mul),

    /// See [`Div`].
    Div(NumFlag, &'static Div),

    /// See [`DivFloor`].
    DivFloor(NumFlag, &'static DivFloor),

    /// See [`Rem`].
    Rem(NumFlag, &'static Rem),

    /// See [`Mod`].
    Mod(NumFlag, &'static Mod),
}

/// For unary operator handle.
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub enum NumFlag {
    Plain,
    Not,
    Neg,
}

/// 1. Evaluate `start`.
/// 2. Evaluate `stop`.
/// 3. Evaluate `step`.
/// 4. Let the result be range(`start`..`stop`, `step`).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct ViewRange {
    pub start: Expr,
    pub stop: Expr,
    pub step: Expr,
}

/// 1. Evaluate `condidion`.
/// 2. If the result of 1. is true, evaluate `then_expr`.
/// 3. Else, evaluate `else_expr`.
/// 4. Let the result be the result of 2. or 3.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Conditional {
    pub condition: Expr,
    pub then_expr: Expr,
    pub else_expr: Expr,
}

/// 1. Evaluate `expr`.
/// 2. For each `i` in `0..args.len()`, evaluate args\[i\].
/// 3. Do the block of the result of 1. with the results of 2.
/// 4. Let the result be the result of 3.
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
///    - 1: For each `i` in `0..l`, do the block of `function` with index `i` of the result of 1.
///    - 2: For each `i` in `0..l`, do the block of `function` with index `i` of the result of 1, and `i`.
/// 5. Let the result be the iterable results of 4.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Map {
    pub iterable: Expr,
    pub function: Expr,
}

/// 1. Get a value of (`scope`, `ptr`).
/// 2. Let the result be the result of 1.
#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub struct Reference {
    scope: usize,
    id: usize,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be bit-and of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BitAnd {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be bit-or of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BitOr {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be bit-xor of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BitXor {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be bit-shift-left of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Shl {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be logical or arithmetic-bit-shift-right of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Shr {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be sum of the results of 1. and 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Add {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be product of the result of 1. by the result of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Mul {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be div result of the result of 1. by the result of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Div {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be quotient of the result of 1. by the result of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct DivFloor {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be reminder of the result of 1. by the result of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Rem {
    pub lhs: Expr,
    pub rhs: Expr,
}

/// 1. Evaluate `lhs`.
/// 2. Evaluate `rhs`.
/// 3. Let the result be mod of the result of 1. by the result of 2.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Mod {
    pub lhs: Expr,
    pub rhs: Expr,
}
