from loguru import logger

if __name__ == "__main__":
    with open("src/data.txt", "r") as f:
        data = f.readlines()

    logger.info(data)
