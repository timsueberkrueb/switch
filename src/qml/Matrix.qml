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

    function randomSolutions(count, min, max) {
        if (!count)
            count = 3;
        if (!min)
            min = -5;
        if (!max)
            max = 5;
        var solutions = [];
        for (var r=0; r<count; r++){
            solutions.push(randomInt(min, max))
        }
        return solutions;
    }

    function randomMatrix(solutions, multiplierMax) {
        var matrix = [];

        // Generating a matrix of random multipliers
        // Definitely not an optimal solution,
        // but it works for this purpose
        var mMatrix = [];
        for (var i=0; i<solutions.length; i++) {
            var mRow = [];
            for (var y=0; y<solutions.length+1; y++) {
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

        for (var r=0; r<solutions.length; r++) {
            var matrixRow = [];

            var solutionMultiplier = mMatrix[r][solutions.length-1];
            var solution = solutions[r] * solutionMultiplier;

            for (var i=0; i<solutions.length; i++) {
                if (r == i)
                    matrixRow.push(solutionMultiplier);
                else {
                    var currentSolution = solutions[i];
                    var multiplier = mMatrix[r][i];
                    var num = multiplier * currentSolution;
                    solution += num;
                    matrixRow.push(multiplier);
                }
            }
            matrixRow.push(solution);
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
