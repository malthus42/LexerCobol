
%option noyywrap caseless

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
%}

DIGITO              [0-9]
LETRA               [A-Z]
ID                  {LETRA}([A-Z0-9]*(-[A-Z0-9]+)*)
NUMERO              [+-]?{DIGITO}+(\.{DIGITO}+)?
LITERAL_TEXTO       \"([^\"\n]|\"\")*\"|\'([^\'\n]|\'\')*\'

ACCEPT              ACCEPT
ACCESS              ACCESS
ADD                 ADD
ADVANCING           ADVANCING
AFTER               AFTER
ALL                 ALL
ALTER               ALTER
AND                 AND
ARE                 ARE
ASCENDING           ASCENDING
ASSIGN              ASSIGN
AT                  AT
BEFORE              BEFORE
BY                  BY
CALL                CALL
CANCEL              CANCEL
CLOSE               CLOSE
COLUMN              COLUMN
COMPUTE             COMPUTE
CONFIGURATION       CONFIGURATION
CONTINUE            CONTINUE
COPY                COPY
DATA                DATA
DELETE              DELETE
DISPLAY             DISPLAY
DIVIDE              DIVIDE
DIVISION            DIVISION
DOWN                DOWN
DUPLICATES          DUPLICATES
ELSE                ELSE
END                 END
ENVIRONMENT         ENVIRONMENT
EVALUATE            EVALUATE
EXIT                EXIT
FALSE               FALSE
FD                  FD
FILE                FILE
FROM                FROM
GIVING              GIVING
GO                  GO
GOBACK              GOBACK
GREATER             GREATER
IDENTIFICATION      IDENTIFICATION
IF                  IF
IN                  IN
INDEX               INDEX
INITIALIZE          INITIALIZE
INPUT               INPUT
INSPECT             INSPECT
INTO                INTO
IS                  IS
JUSTIFIED           JUSTIFIED
KEY                 KEY
LEADING             LEADING
LEFT                LEFT
LENGTH              LENGTH
LESS                LESS
LINKAGE             LINKAGE
MERGE               MERGE
MOVE                MOVE
MULTIPLY            MULTIPLY
NEGATIVE            NEGATIVE
NEXT                NEXT
NO                  NO
NOT                 NOT
NUMERIC             NUMERIC
OBJECT_COMPUTER     OBJECT-COMPUTER
OCCURS              OCCURS
OF                  OF
OMITTED             OMITTED
ON                  ON
OPEN                OPEN
OPTIONAL            OPTIONAL
OR                  OR
ORGANIZATION        ORGANIZATION
OTHER               OTHER
OUTPUT              OUTPUT
PERFORM             PERFORM
PIC                 PIC
PICTURE             PICTURE
POSITIVE            POSITIVE
PROCEDURE           PROCEDURE
PROGRAM_ID          PROGRAM-ID
READ                READ
REDEFINES           REDEFINES
REPLACING           REPLACING
RETURN              RETURN
REWRITE             REWRITE
RUN                 RUN
SECTION             SECTION
SELECT              SELECT
SET                 SET
SIGN                SIGN
SIZE                SIZE
SORT                SORT
SOURCE_COMPUTER     SOURCE-COMPUTER
SPACE               SPACE
SPACES              SPACES
SPECIAL_NAMES       SPECIAL-NAMES
START               START
STOP                STOP
STRING              STRING
SUBTRACT            SUBTRACT
SUM                 SUM
SYNC                SYNC
SYNCHRONIZED        SYNCHRONIZED
THAN                THAN
THEN                THEN
THROUGH             THROUGH
THRU                THRU
TIMES               TIMES
TO                  TO
TRUE                TRUE
UNSTRING            UNSTRING
UNTIL               UNTIL
UP                  UP
UPON                UPON
USAGE               USAGE
USE                 USE
USING               USING
VALUE               VALUE
VALUES              VALUES
VARYING             VARYING
WHEN                WHEN
WITH                WITH
WORKING_STORAGE     WORKING-STORAGE
WRITE               WRITE
ZERO                ZERO
ZEROS               ZEROS

%%

{LITERAL_TEXTO} {
    printf("LITERAL TEXTO: %s\n", yytext);
}

{NUMERO} {
    printf("LITERAL NUMERICO: %s\n", yytext);
}

{ACCEPT}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ACCESS}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ADD}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ADVANCING}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{AFTER}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ALL}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ALTER}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{AND}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ARE}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ASCENDING}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ASSIGN}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{AT}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{BEFORE}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{BY}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{CALL}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{CANCEL}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{CLOSE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{COLUMN}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{COMPUTE}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{CONFIGURATION}     { printf("PALAVRA RESERVADA: %s\n", yytext); }
{CONTINUE}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{COPY}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DATA}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DELETE}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DISPLAY}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DIVIDE}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DIVISION}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DOWN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{DUPLICATES}        { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ELSE}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{END}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ENVIRONMENT}       { printf("PALAVRA RESERVADA: %s\n", yytext); }
{EVALUATE}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{EXIT}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{FALSE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{FD}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{FILE}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{FROM}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{GIVING}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{GO}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{GOBACK}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{GREATER}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{IDENTIFICATION}    { printf("PALAVRA RESERVADA: %s\n", yytext); }
{IF}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{IN}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{INDEX}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{INITIALIZE}        { printf("PALAVRA RESERVADA: %s\n", yytext); }
{INPUT}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{INSPECT}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{INTO}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{IS}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{JUSTIFIED}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{KEY}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{LEADING}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{LEFT}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{LENGTH}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{LESS}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{LINKAGE}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{MERGE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{MOVE}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{MULTIPLY}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{NEGATIVE}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{NEXT}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{NO}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{NOT}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{NUMERIC}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OBJECT_COMPUTER}   { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OCCURS}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OF}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OMITTED}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ON}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OPEN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OPTIONAL}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OR}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ORGANIZATION}      { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OTHER}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{OUTPUT}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{PERFORM}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{PIC}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{PICTURE}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{POSITIVE}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{PROCEDURE}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{PROGRAM_ID}        { printf("PALAVRA RESERVADA: %s\n", yytext); }
{READ}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{REDEFINES}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{REPLACING}         { printf("PALAVRA RESERVADA: %s\n", yytext); }
{RETURN}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{REWRITE}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{RUN}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SECTION}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SELECT}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SET}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SIGN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SIZE}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SORT}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SOURCE_COMPUTER}   { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SPACE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SPACES}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SPECIAL_NAMES}     { printf("PALAVRA RESERVADA: %s\n", yytext); }
{START}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{STOP}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{STRING}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SUBTRACT}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SUM}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SYNC}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{SYNCHRONIZED}      { printf("PALAVRA RESERVADA: %s\n", yytext); }
{THAN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{THEN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{THROUGH}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{THRU}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{TIMES}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{TO}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{TRUE}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{UNSTRING}          { printf("PALAVRA RESERVADA: %s\n", yytext); }
{UNTIL}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{UP}                { printf("PALAVRA RESERVADA: %s\n", yytext); }
{UPON}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{USAGE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{USE}               { printf("PALAVRA RESERVADA: %s\n", yytext); }
{USING}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{VALUE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{VALUES}            { printf("PALAVRA RESERVADA: %s\n", yytext); }
{VARYING}           { printf("PALAVRA RESERVADA: %s\n", yytext); }
{WHEN}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{WITH}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{WORKING_STORAGE}   { printf("PALAVRA RESERVADA: %s\n", yytext); }
{WRITE}             { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ZERO}              { printf("PALAVRA RESERVADA: %s\n", yytext); }
{ZEROS}             { printf("PALAVRA RESERVADA: %s\n", yytext); }

"." {
    printf("PONTO\n");
}

"," {
    printf("VIRGULA\n");
}

";" {
    printf("PONTO E VIRGULA\n");
}

[ \t\r\n]+ {
}

{ID} {
    if (strlen(yytext) > 30) {
        fprintf(stderr,
                "Erro lexico: identificador excede 30 caracteres: %s\n",
                yytext);
    } else {
        printf("IDENTIFICADOR: %s\n", yytext);
    }
}

. {
    fprintf(stderr, "Caractere invalido: %s\n", yytext);
}

%%

int main(int argc, char *argv[]) {
    FILE *arquivo = stdin;
    char *linha = NULL;
    size_t capacidade = 0;
    ssize_t tamanho;
    int numero_linha = 0;

    if (argc > 2) {
        fprintf(stderr, "Uso: %s [arquivo.cob]\n", argv[0]);
        return 1;
    }

    if (argc == 2) {
        arquivo = fopen(argv[1], "r");

        if (arquivo == NULL) {
            perror(argv[1]);
            return 1;
        }
    }

    while ((tamanho = getline(&linha, &capacidade, arquivo)) != -1) {
        numero_linha++;

        while (tamanho > 0 &&
               (linha[tamanho - 1] == '\n' ||
                linha[tamanho - 1] == '\r')) {
            linha[--tamanho] = '\0';
        }

        if (tamanho < 7) {
            continue;
        }

        char indicador = linha[6];

        if (indicador == '*' || indicador == '/') {
            continue;
        }

        size_t inicio = 7;
        size_t comprimento = (size_t)tamanho - inicio;

        if (comprimento > 65) {
            comprimento = 65;
        }

        char codigo[66];
        memcpy(codigo, linha + inicio, comprimento);
        codigo[comprimento] = '\0';

        if (indicador == '-') {
            fprintf(stderr,
                    "Aviso na linha %d: continuacao ainda nao implementada.\n",
                    numero_linha);
        }

        YY_BUFFER_STATE buffer = yy_scan_string(codigo);
        yylex();
        yy_delete_buffer(buffer);
    }

    free(linha);

    if (arquivo != stdin) {
        fclose(arquivo);
    }

    return 0;
}
