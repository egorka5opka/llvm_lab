FILENAME = "pass/IRtrace.log"

def main():
    for w in range(1, 6):
        frequency = dict()
        lines = []
        with open(FILENAME) as f:
            for ln in f.readlines():
                lines.append(ln.strip())
                if (len(lines) == w):
                    cur = "\n".join(lines)
                    if cur not in frequency:
                        frequency[cur] = 1
                    else:
                        frequency[cur] += 1
                    lines.pop(0)
        lns = list(frequency.items())
        lns.sort(key=lambda x : x[1])
        print(f"========================{w}==================")
        for k, cnt in lns[-5:]:
            print(k)
            print(f"times: {cnt}")
            print()
        print()


main()
