from loguru import logger
import numpy as np
from python_prtree import PRTree2D


def do():
    idxes = np.array([1, 2])

    # rects is a list of (xmin, ymin, xmax, ymax)
    rects = np.array([[0.0, 0.0, 1.0, 0.5], [1.0, 1.5, 1.2, 3.0]])

    prtree = PRTree2D(idxes, rects)

    # batch query
    q = np.array([[0.5, 0.2, 0.6, 0.3], [0.8, 0.5, 1.5, 3.5]])
    result = prtree.batch_query(q)
    print(result)
    # [[1], [1, 2]]

    # You can insert an additional rectangle by insert method,
    prtree.insert(3, np.array([1.0, 1.0, 2.0, 2.0]))
    q = np.array([[0.5, 0.2, 0.6, 0.3], [0.8, 0.5, 1.5, 3.5]])
    result = prtree.batch_query(q)
    print(result)
    # [[1], [1, 2, 3]]

    # Plus, you can erase by an index.
    prtree.erase(2)
    result = prtree.batch_query(q)
    print(result)
    # [[1], [1, 3]]

    # Non-batch query is also supported.
    print(prtree.query(0.5, 0.5))
    # [1]
    print(prtree.query((0.5, 0.5)))
    # [1]


if __name__ == "__main__":
    with open("src/data.txt", "r") as f:
        data = f.readlines()

    logger.info(data)
    input(">>> ")
    do()
