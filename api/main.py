from RestrictedPython import compile_restricted
from fastapi import FastAPI
import uvicorn
from RestrictedPython.PrintCollector import PrintCollector
import io
import sys

app = FastAPI()

loc = {'_print_': PrintCollector, '_getattr_': getattr,
       "_getitem_": lambda x, y: x[y]}


@ app.get("/python/")
async def read_code(code: str, input: str = None):
    try:
        code = compile_restricted(code, "<string>", "exec")
        sys.stdin = io.StringIO(input)
        exec(code, loc)
        result = loc['_print']()

        return {"status": "success", "result": result}
    except Exception as e:
        return {"status": "error", "message": str(e)}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000, log_level="debug")
