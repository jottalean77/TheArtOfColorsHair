class ColoracaoHelper {
  String determinarFormulaCor(int corBaseCliente, int porcentagemBranco, int alturaTomDesejada) {
    String formula = '';

    // Identificar a neutralização com base nas cores complementares
    if (corBaseCliente > alturaTomDesejada) {
      // Cabelo mais escuro que o tom desejado - precisa clarear
      formula = 'Usar descolorante + tonalizante no tom desejado (${alturaTomDesejada})';
    } else if (corBaseCliente < alturaTomDesejada) {
      // Cabelo mais claro que o tom desejado - precisa escurecer
      formula = 'Adicionar pigmento da cor desejada (tom ${alturaTomDesejada})';
    }

    // Neutralização de tons indesejados
    if (corBaseCliente == 7 && alturaTomDesejada == 6) {
      formula += ' e adicionar tonalizante azul para neutralizar laranja';
    } else if (corBaseCliente == 8 && alturaTomDesejada == 7) {
      formula += ' e adicionar tonalizante violeta para neutralizar amarelo';
    }

    // Ajuste de nuance com base no subtom desejado
    switch (alturaTomDesejada) {
      case 6:
        formula += ' + acinzentado (6.1) para um resultado frio';
        break;
      case 8:
        formula += ' + dourado (8.3) para um resultado quente';
        break;
      default:
        formula += ' + ajuste de nuance conforme desejado';
    }

    // Consideração para cabelos com porcentagem alta de branco
    if (porcentagemBranco > 50) {
      formula += ' e usar tonalizante para cobertura de brancos';
    }

    return formula;
  }
}
