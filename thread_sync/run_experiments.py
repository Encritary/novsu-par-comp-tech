import subprocess
import sys

if len(sys.argv) != 2 or sys.argv[1] not in ("scripts", "O0", "O2", "race_O0", "race_O2"):
    print(f"Usage: python3 {sys.argv[0]} scripts|O0|O2|race_O0|race_O2", file=sys.stderr)
    sys.exit(1)

mode = sys.argv[1]


def run(program, n, m, *args):
    output = subprocess.check_output([f"./{program}", str(n), str(m), *args], text=True)
    return dict(line.split(" = ") for line in output.splitlines())


if mode == "scripts":
    print("N,M,variant,a,N*M", flush=True)
    for variant in ("plain", "lock"):
        for n, m in ((1, 2), (10, 2), (100, 2), (100, 4), (100, 8)):
            for trial in range(3):
                values = run("script_b.sh", n, m, variant)
                print(f"{n},{m},{variant},{values['a']},{values['expected']}", flush=True)

elif mode in ("race_O0", "race_O2"):
    opt = mode.split("_")[1]
    print("N,M,variant,runs,less", flush=True)
    for n in (2, 4, 8):
        m = 1_000_000
        for variant in ("variable", "increment"):
            less = 0
            for trial in range(100):
                values = run(f"{variant}_{opt}", n, m)
                less += int(values["a"]) < int(values["expected"])
            print(f"{n},{m},{variant},100,{less}", flush=True)

else:
    opt = mode
    print("N,M,variant,a,N*M,ms", flush=True)
    for n in (2, 4, 8):
        for m in (100_000, 1_000_000, 10_000_000):
            for variant in ("variable", "increment", "mutex", "atomic", "semaphore"):
                values = run(f"{variant}_{opt}", n, m)
                print(f"{n},{m},{variant},{values['a']},{values['expected']},{values['ms']}", flush=True)
