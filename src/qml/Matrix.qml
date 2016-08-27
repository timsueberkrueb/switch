pragma Singleton
import QtQuick 2.4

QtObject {
    function gcdOfArray(input) {
        if (toString.call(input) !== "[object Array]")
            var len, a, b;
        len = input.length;
        if ( !len )
            return null;
        a = input[ 0 ];
        for ( var i = 1; i < len; i++ ) {
            b = input[ i ];
            a = gcd( a, b );
        }
        return a;
    }

    function gcd(a, b) {
        if ( ! b)
            return a;
        return gcd(b, a % b);
    }

    function randomInt(min, max){
        if (!min)
            min = 1
        if (!max)
            max = 3
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function randomSolution(count, min, max) {
        if (!count)
            count = 3;
        if (!min)
            min = -5;
        if (!max)
            max = 5;
        var solution = [];
        for (var r=0; r<count; r++){
            solution.push(randomInt(min, max))
        }
        return solution;
    }

    function shuffleArray(array) {
        for (var i = array.length - 1; i > 0; i--) {
            var j = Math.floor(Math.random() * (i + 1));
            var temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
        return array;
    }

    function determinant(matrix) {
        var matrixArr = matrix.slice();

        if(matrixArr.length === 1)
            return matrixArr[0][0];
        if(matrixArr.length === 2)
            return matrixArr[0][0] * matrixArr[1][1] - matrixArr[0][1] * matrixArr[1][0];

        var result = 0;
        var sign = +1;
        var minor;
        for (var i = 0; i < matrixArr.length; i++) {
            minor = [];
            for (var ii in matrixArr) {
                minor.push(matrixArr[ii].slice());
            }
            minor.splice(i, 1);
            for (var j = 0; j < minor.length; j++) {
                minor[j].splice(0, 1);
            }

            result += sign * matrixArr[i][0] * determinant(minor);
            sign *= -1;
        }
        return result;
    }

    function randomMatrix(solution, multiplierMax) {
        var solutionCount = solution.length;
        var min = -multiplierMax;
        var max = multiplierMax;

        console.log("Solution: %1".arg(JSON.stringify(solution)))

        // All possible entry multipliers
        var possibleRows = [];
        var currentRow = [];
        var lastRow = false;
        for (var i = 0; i < solutionCount; i++)
            currentRow[i] = min;
        for (var idx=0; !lastRow; idx++) {
            possibleRows[idx] = currentRow.slice();
            currentRow[0]++;
            for (var i = 0; i < solutionCount; i++) {
                if(currentRow[i] > max) {
                    if(i === solutionCount - 1) {
                        lastRow = true;
                        break;
                    }

                    currentRow[i] = min;
                    currentRow[i+1]++;
                } else {
                    break;
                }
            }
            var allZeros = true;
            for (var i = 0; i < solutionCount; i++) {
                if(currentRow[i] !== 0)
                    allZeros = false;
            }
            if(allZeros)
                currentRow[0]++;
        }

        console.log("Count of possible rows for given parameters:", possibleRows.length)

        shuffleArray(possibleRows)
        var matrix = [];
        for (var i = 0; i < possibleRows.length; i++) {
            // Check if possibleRows[i] zeroes determinant
            var test = matrix.concat([possibleRows[i]])
            if(determinant(test) !== 0) {
                matrix.push(possibleRows[i]);
            }
            if(matrix.length >= solutionCount)
                break;
        }

        for (var i in matrix) {
            var extension = 0;
            var row = matrix[i];
            for (var j in row) {
                extension += row[j] * solution[i];
            }
            row.push(extension);
        }

        console.log("Extended matrix for equation:", JSON.stringify(matrix));
        return matrix;
    }

    function addRowToRow(addRow, baseRow){
        for (var i=0; i<baseRow.length; i++ ) {
            baseRow[i] = baseRow[i] + addRow[i];
        }
        return baseRow;
    }

    function multiplyRow(row, multiplier) {
        var newRow = [];
        for (var i=0; i<row.length; i++){
            newRow.push(row[i]*multiplier);
        }
        return newRow;
    }
}
