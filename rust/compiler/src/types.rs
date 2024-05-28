#[derive(Copy, Clone, Debug, Eq, PartialEq)]
#[repr(u8)]
pub enum RvalType {
    Bool = 0,
    U8,
    I32,
    U32,
    I64,
    U64,
    Float,
    Double,
    Iterable(&'static RvalType),
    Fn(&'static FnType),
}

#[derive(Copy, Clone, Debug, Eq, PartialEq)]
#[repr(u8)]
pub enum MutType {
    MutBool = 10,
    MutU8,
    MutI32,
    MutU32,
    MutI64,
    MutU64,
    MutFloat,
    MutDouble,
}

#[derive(Copy, Clone, Debug, Eq, PartialEq)]
#[repr(u8)]
pub enum Type {
    Bool = 0,
    U8,
    I32,
    U32,
    I64,
    U64,
    Float,
    Double,
    Iterable(&'static RvalType),
    Fn(&'static FnType),
    MutBool,
    MutU8,
    MutI32,
    MutU32,
    MutI64,
    MutU64,
    MutFloat,
    MutDouble,
}
impl Type {
    pub const fn is_mut(self) -> bool {
        use Type::*;
        match self {
            Bool | U8 | I32 | U32 | I64 | U64 | Float | Double | Iterable(_) | Fn(_) => false,
            MutBool | MutU8 | MutI32 | MutU32 | MutI64 | MutU64 | MutFloat | MutDouble => true,
        }
    }
}

#[derive(Copy, Clone, Debug, Eq, PartialEq)]
pub struct FnType {
    pub return_type: Option<RvalType>,
    pub args_types: &'static [RvalType],
}

impl From<RvalType> for Type {
    #[inline(always)]
    fn from(value: RvalType) -> Self {
        match value {
            RvalType::Bool => Type::Bool,
            RvalType::U8 => Type::U8,
            RvalType::I32 => Type::I32,
            RvalType::U32 => Type::U32,
            RvalType::I64 => Type::I64,
            RvalType::U64 => Type::U64,
            RvalType::Float => Type::Float,
            RvalType::Double => Type::Double,
            RvalType::Iterable(x) => Type::Iterable(x),
            RvalType::Fn(f) => Type::Fn(f),
        }
    }
}

impl From<MutType> for Type {
    #[inline(always)]
    fn from(value: MutType) -> Self {
        match value {
            MutType::MutBool => Type::MutBool,
            MutType::MutU8 => Type::MutU8,
            MutType::MutI32 => Type::MutI32,
            MutType::MutU32 => Type::MutU32,
            MutType::MutI64 => Type::MutI64,
            MutType::MutU64 => Type::MutU64,
            MutType::MutFloat => Type::MutFloat,
            MutType::MutDouble => Type::MutDouble,
        }
    }
}
