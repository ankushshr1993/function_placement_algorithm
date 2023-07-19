import random
from time import time

def getRandomMatrix(rows, cols, min_val, max_val):
    matrix = []
    for _ in range(rows):
        row = [random.randint(min_val, max_val) for _ in range(cols)]
        matrix.append(row)
    return matrix

def matrixMultiplication():
    random.seed(42)
    t0 = time()

    A = getRandomMatrix(900, 800, 100, 200)
    B = getRandomMatrix(800, 700, 100, 200)

    C = []
    for i in range(len(A)):
        row = []
        for j in range(len(B[0])):
            element = 0
            for k in range(len(B)):
                element += A[i][k] * B[k][j]
            row.append(element)
        C.append(row)

    tm = time() - t0
    return tm

def main(args):
    output = matrixMultiplication()
    return {"output": output}
