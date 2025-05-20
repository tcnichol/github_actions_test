import time

version="v1.0.6"

def main():
    num_loops = 0
    while (True):
        print(f"Version is {version}")
        print("Testing testing")
        print(f"Loop number {num_loops}")
        print("waiting ten seconds...")
        time.sleep(10)
        num_loops += 1

if __name__ == "__main__":
    main()
