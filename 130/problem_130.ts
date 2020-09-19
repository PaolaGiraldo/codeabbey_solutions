function combinations(
  set: Array<string>,
  dataTemp: Map<number, string>,
  variables: Array<number>,
  result: Map<string, string>
): Map<string, string> {
  const pos = 3;
  const [numEl, index] = [variables[pos], variables[2]];

  if (index === numEl) {
    result.set(Array.from(dataTemp.values()).join(''), '');

    return result;
  }

  const [start, end] = [variables[0], variables[1]];
  const step = 1;
  const iterable = Array.from(
    { length: (end - start) / step + step },
    (_var, i) => start + i * step
  );
  iterable.forEach((i: number) => {
    if (end - i + 1 >= numEl - index) {
      dataTemp.set(index, set[i]);
      const variablesNew = [i + 1, end, index + 1, numEl];
      combinations(set, dataTemp, variablesNew, result);
    }
    return result;
  });

  return result;
}

function dataProcessing(inputData: string): number {
  const rowsData = inputData.split('of ');
  const setPrev = rowsData[1].split('\n');
  const set = setPrev[0].split(' ');
  const zero = 0;
  const variables = [zero, set.length - 1, zero, Number(rowsData[0])];
  const dataTemp = new Map();

  const output = new Map();
  const comb = combinations(set, dataTemp, variables, output);
  console.log(Array.from(comb.keys()).join(' '));
  return 0;
}

function main(): number {
  process.stdin.setEncoding('utf8');
  process.stdin.on('readable', () => {
    const inputData = process.stdin.read();
    if (inputData !== null) {
      dataProcessing(inputData);
    }
    return 'Data Loaded';
  });
  return 0;
}

main();
