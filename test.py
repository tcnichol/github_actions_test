import time
import sys
def main():
    for i in range(0, 100):
        print(f"Hello world v1.0.4 loop {i}")
        sys.stdout.flush()
        time.sleep(10)

if __name__ == "__main__":
    main()