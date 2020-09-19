function modInverse(extendedGDC: number[], numData: number[]): number {
  const gdc = 1;
  if (extendedGDC[0] === gdc) {
    if (extendedGDC[2] < 0) {
      const inv = extendedGDC[2] + numData[0];
      modInverse([extendedGDC[0], extendedGDC[1], inv], numData);
    } else {
      const x =
        numData[0] - Math.abs((extendedGDC[2] * -numData[2]) % numData[0]);
      console.log(x);
    }
  } else {
    console.log(-gdc);
  }

  return 1;
}

function gdcExtended(
  dataGDC: number[],
  prevX: number,
  prevY: number,
  x: number,
  y: number
): number[] {
  if (dataGDC[1] === 0) {
    const result = [dataGDC[0], prevX, prevY];
    return result;
  }
  const quotient = Math.floor(dataGDC[0] / dataGDC[1]);
  const Xnext = prevX - quotient * x;
  const Ynext = prevY - quotient * y;
  const result = gdcExtended(
    [dataGDC[1], dataGDC[0] % dataGDC[1]],
    x,
    y,
    Xnext,
    Ynext
  );
  return result;
}

function dataProcessing(inputData: string): number {
  const rowsData = inputData.split('\n').slice(1);

  rowsData.forEach((row: string) => {
    const numData = row.split(' ').map((numStr: string) => Number(numStr));
    const dataGDC: number[] = [numData[1], numData[0]];
    const [prevX, x, prevY, y] = [1, 0, 0, 1];
    const result = gdcExtended(dataGDC, prevX, prevY, x, y);
    modInverse(result, numData);
    return 1;
  });
  return 1;
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
  return 1;
}

main();
