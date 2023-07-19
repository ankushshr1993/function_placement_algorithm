function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandomMatrix(rows, cols, min, max) {
  const matrix = [];
  for (let i = 0; i < rows; i++) {
    matrix[i] = [];
    for (let j = 0; j < cols; j++) {
      matrix[i][j] = getRandomInt(min, max);
    }
  }
  return matrix;
}

function matrixMultiplication() {
  const t0 = Date.now();

  const A = getRandomMatrix(900, 800, 100, 200);
  const B = getRandomMatrix(800, 700, 100, 200);

  const C = [];
  for (let i = 0; i < A.length; i++) {
    C[i] = [];
    for (let j = 0; j < B[0].length; j++) {
      let sum = 0;
      for (let k = 0; k < A[0].length; k++) {
        sum += A[i][k] * B[k][j];
      }
      C[i][j] = sum;
    }
  }

  const tm = (Date.now() - t0) / 1000;
  return tm;
}

function main(params) {
  const output = matrixMultiplication();
  return { output: output };
}
