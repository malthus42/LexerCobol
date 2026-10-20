
%option noyywrap caseless nodefault

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int linha_atual = 0;

static void analisar_codigo(const char *codigo, int linha);
%}


RESERVADAS_1 ACCEPT|ADD|ALL|ALTER|AND|ARE|AT|AUTHOR|BEFORE|BY|CALL|CANCEL|CLASS|CLOSE|COMPUTE|CONFIGURATION|CONTINUE|COPY|DATA|DATE|DELETE|DISPLAY|DIVIDE
RESERVADAS_2 DIVISION|ELSE|END|ENVIRONMENT|EVALUATE|EXIT|FD|FILE|FROM|GIVING|GO|IF|IN|INITIALIZE|INPUT|INSPECT|INSTALLATION|INTO|INVALID|IS|KEY|LINKAGE|MOVE
RESERVADAS_3 MULTIPLY|NOT|OCCURS|OF|ON|OPEN|OR|OUTPUT|PERFORM|PIC|PICTURE|PROCEDURE|PROGRAM|PROGRAM-ID|READ|RECEIVE|REDEFINES|REMAINDER|REPLACING|RETURN|RUN
RESERVADAS_4 SEARCH|SECTION|SELECT|SET|STOP|STRING|SUBTRACT|THEN|THROUGH|THRU|TIMES|TO|UNTIL|USE|USING|VALUE|VALUES|WHEN|WITH|WORKING-STORAGE|WRITE
RESERVADAS_5 DATE-COMPILED|DATE-WRITTEN|REMARKS|SECURITY|SOURCE-COMPUTER|OBJECT-COMPUTER|FILE-CONTROL|INPUT-OUTPUT|I-O-CONTROL|SPECIAL-NAMES
RESERVADAS_6 ALPHABETIC|ALPHANUMERIC|ASCENDING|BINARY|BLANK|BLOCK|CHARACTERS|CODE|COMMA|COMP|COMP-1|COMP-2|COMP-3|COMP-4|COMP-5|COMPUTATIONAL|CONTENT|COUNT
RESERVADAS_7 DEPENDING|DESCENDING|DESTINATION|DOWN|DUPLICATES|DYNAMIC|ERROR|EVERY|EXCEPTION|EXTEND|EXTERNAL|FALSE|FILLER|FINAL|FIRST|FOOTING|FOR|GLOBAL
RESERVADAS_8 HEADING|HIGH-VALUE|HIGH-VALUES|INDEX|INDEXED|JUSTIFIED|LAST|LEADING|LEFT|LENGTH|LESS|LIMIT|LINE|LINES|LOW-VALUE|LOW-VALUES|MEMORY
RESERVADAS_9 NEGATIVE|NEXT|NO|NULL|NULLS|NUMBER|NUMERIC|OFF|OMITTED|OPTIONAL|ORDER|ORGANIZATION|OTHER|OVERFLOW|PACKED-DECIMAL|PADDING|PAGE|POSITIVE|PRINTING
RESERVADAS_10 RECORD|RECORDING|RECORDS|RELATIVE|RENAMES|REPLACE|REPORT|REPORTING|REQUIRED|RESET|REVERSE-VIDEO|REWIND|RIGHT|ROUNDED|SAME|SD|SEGMENT|SEQUENTIAL|SIGN
RESERVADAS_11 SIZE|SORT|SOURCE|SPACE|SPACES|STANDARD|START|STATUS|SUPPRESS|SYMBOLIC|SYNC|SYNCHRONIZED|TABLE|TALLYING|TAPE|TERMINATE|TEST|THAN|TIME|TRAILING|TRUE
RESERVADAS_12 TYPE|UNIT|UNSTRING|UP|UPON|USAGE|ZERO|ZEROS|ZEROES

DIGITO          [0-9]
LETRA           [A-Z]
ID              {LETRA}([A-Z0-9_-]*[A-Z0-9])?
NUMERO          [0-9]+(\.[0-9]+)?
LITERAL_TEXTO   \"([^\"\n]|\"\")*\"|\'([^\'\n]|\'\')*\'

%%

[ \t\r]+                    ;
\n                          ;

{LITERAL_TEXTO} {
    printf("Linha %d: LITERAL_TEXTO: %s\n", linha_atual, yytext);
}

{RESERVADAS_1}|{RESERVADAS_2}|{RESERVADAS_3}|{RESERVADAS_4}|{RESERVADAS_5}|{RESERVADAS_6}|{RESERVADAS_7}|{RESERVADAS_8}|{RESERVADAS_9}|{RESERVADAS_10}|{RESERVADAS_11}|{RESERVADAS_12} {
    printf("Linha %d: PALAVRA_RESERVADA: %s\n", linha_atual, yytext);
}

{NUMERO} {
    printf("Linha %d: NUMERO: %s\n", linha_atual, yytext);
}

{ID} {
    printf("Linha %d: IDENTIFICADOR: %s\n", linha_atual, yytext);
}

"**" {
    printf("Linha %d: OPERADOR_ARITMETICO: %s\n", linha_atual, yytext);
}

">="|"<="|"<>" {
    printf("Linha %d: OPERADOR_RELACIONAL: %s\n", linha_atual, yytext);
}

"="|">"|"<" {
    printf("Linha %d: OPERADOR_RELACIONAL: %s\n", linha_atual, yytext);
}

"+"|"-"|"*"|"/" {
    printf("Linha %d: OPERADOR_ARITMETICO: %s\n", linha_atual, yytext);
}

"(" {
    printf("Linha %d: PARENTESE_ABRE: %s\n", linha_atual, yytext);
}

")" {
    printf("Linha %d: PARENTESE_FECHA: %s\n", linha_atual, yytext);
}

"." {
    printf("Linha %d: PONTO: %s\n", linha_atual, yytext);
}

"," {
    printf("Linha %d: VIRGULA: %s\n", linha_atual, yytext);
}

";" {
    printf("Linha %d: PONTO_E_VIRGULA: %s\n", linha_atual, yytext);
}

":" {
    printf("Linha %d: DOIS_PONTOS: %s\n", linha_atual, yytext);
}

. {
    printf("Linha %d: CARACTERE_INVALIDO: %s\n", linha_atual, yytext);
}

%%

static void analisar_codigo(const char *codigo, int linha)
{
    linha_atual = linha;

    YY_BUFFER_STATE buffer = yy_scan_string(codigo);
    yylex();
    yy_delete_buffer(buffer);
}

int main(void)
{
    char *linha = NULL;
    size_t capacidade = 0;
    ssize_t tamanho;
    int numero_linha = 0;

    char codigo_pendente[8192] = "";
    int linha_pendente = 0;

    while ((tamanho = getline(&linha, &capacidade, stdin)) != -1) {
        numero_linha++;

        if (tamanho > 0 && linha[tamanho - 1] == '\n') {
            linha[--tamanho] = '\0';
        }

        if (tamanho > 0 && linha[tamanho - 1] == '\r') {
            linha[--tamanho] = '\0';
        }

        if (tamanho < 7) {
            continue;
        }

        char indicador = linha[6];

   
        if (indicador == '*' || indicador == '/') {
            continue;
        }

     
        size_t comprimento = (size_t)tamanho - 7;

        if (comprimento > 65) {
            comprimento = 65;
        }

        char codigo[66];
        memcpy(codigo, linha + 7, comprimento);
        codigo[comprimento] = '\0';

        if (indicador == '-') {
            
            if (codigo_pendente[0] == '\0') {
                fprintf(stderr,
                        "Aviso: continuacao sem linha anterior na linha %d.\n",
                        numero_linha);
                strncpy(codigo_pendente, codigo,
                        sizeof(codigo_pendente) - 1);
                codigo_pendente[sizeof(codigo_pendente) - 1] = '\0';
                linha_pendente = numero_linha;
            } else {
                size_t usados = strlen(codigo_pendente);
                size_t disponivel =
                    sizeof(codigo_pendente) - usados - 1;
                size_t adicionar = strlen(codigo);

                if (adicionar > disponivel) {
                    adicionar = disponivel;
                    fprintf(stderr,
                            "Erro: continuacao muito longa na linha %d.\n",
                            numero_linha);
                }

                strncat(codigo_pendente, codigo, adicionar);
            }

            continue;
        }

       
        if (codigo_pendente[0] != '\0') {
            analisar_codigo(codigo_pendente, linha_pendente);
        }

        strncpy(codigo_pendente, codigo,
                sizeof(codigo_pendente) - 1);
        codigo_pendente[sizeof(codigo_pendente) - 1] = '\0';
        linha_pendente = numero_linha;
    }

    if (codigo_pendente[0] != '\0') {
        analisar_codigo(codigo_pendente, linha_pendente);
    }

    free(linha);
    return 0;
}
