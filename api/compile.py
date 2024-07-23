import urllib.parse


def f(code):
    print(urllib.parse.quote(code))


f("""
print(input())
""")
