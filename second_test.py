import time


def main():
    num_loops = 0
    while (True):
        print("Testing testing")
        print(f"Loop number {num_loops}")
        print("waiting ten seconds...")
        time.sleep(10)
        num_loops += 1

if __name__ == "__main__":
    main()
