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

    function randomMatrix(solution, multiplierMax) {
        var matrix = [];

        // Generating a matrix of random multipliers
        // Definitely not an optimal solution,
        // but it works for this purpose
        var mMatrix = [];
        for (var i=0; i<solution.length; i++) {
            var mRow = [];
            for (var y=0; y<solution.length+1; y++) {
                var randNum = randomInt(1, multiplierMax);
                if (randNum === 0)
                    randNum = 1;
                if (i===y) {
                    randNum *= -1;
                }
                mRow.push(randNum);
            }
            mMatrix.push(mRow);
        }

        for (var r=0; r<solution.length; r++) {
            var matrixRow = [];

            var solutionMultiplier = mMatrix[r][r];
            var solutionValue = solution[r] * solutionMultiplier;

            for (var i=0; i<solution.length; i++) {
                if (r == i)
                    matrixRow.push(solutionMultiplier);
                else {
                    var currentSolution = solution[i];
                    var multiplier = mMatrix[r][i];
                    var num = multiplier * currentSolution;
                    solutionValue += num;
                    matrixRow.push(multiplier);
                }
            }
            matrixRow.push(solutionValue);
            matrix.push(matrixRow);
        }
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
