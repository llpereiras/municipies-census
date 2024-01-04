# frozen_string_literal: true

class CnsValidator
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def valida_cns(cns)
    return false if cns&.strip&.length != 15

    resultado = ''

    pis = cns[0..10]

    soma = (pis[0].to_i * 15) +
           (pis[1].to_i * 14) +
           (pis[2].to_i * 13) +
           (pis[3].to_i * 12) +
           (pis[4].to_i * 11) +
           (pis[5].to_i * 10) +
           (pis[6].to_i * 9) +
           (pis[7].to_i * 8) +
           (pis[8].to_i * 7) +
           (pis[9].to_i * 6) +
           (pis[10].to_i * 5)

    resto = soma % 11
    dv = 11 - resto

    dv = 0 if dv == 11

    if dv == 10
      soma = (pis[0].to_i * 15) +
             (pis[1].to_i * 14) +
             (pis[2].to_i * 13) +
             (pis[3].to_i * 12) +
             (pis[4].to_i * 11) +
             (pis[5].to_i * 10) +
             (pis[6].to_i * 9) +
             (pis[7].to_i * 8) +
             (pis[8].to_i * 7) +
             (pis[9].to_i * 6) +
             (pis[10].to_i * 5) + 2

      resto = soma % 11
      dv = 11 - resto
      resultado = "#{pis}001#{dv.to_i}"
    else
      resultado = "#{pis}000#{dv.to_i}"
    end

    return false if cns != resultado

    true
  end

  def valida_cns_prov(cns)
    # Se o tamanho do cns for diferente de 15, retorna falso
    return false if cns.strip.length != 15

    # Declara as variáveis dv, resto e soma

    # Calcula a soma dos produtos dos dígitos do cns por pesos decrescentes de 15 a 1
    soma = (cns[0].to_i * 15) +
           (cns[1].to_i * 14) +
           (cns[2].to_i * 13) +
           (cns[3].to_i * 12) +
           (cns[4].to_i * 11) +
           (cns[5].to_i * 10) +
           (cns[6].to_i * 9) +
           (cns[7].to_i * 8) +
           (cns[8].to_i * 7) +
           (cns[9].to_i * 6) +
           (cns[10].to_i * 5) +
           (cns[11].to_i * 4) +
           (cns[12].to_i * 3) +
           (cns[13].to_i * 2) +
           (cns[14].to_i * 1)

    # Calcula o resto da divisão da soma por 11
    resto = soma % 11

    # Se o resto for diferente de 0, retorna falso
    return false if resto != 0

    true
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end
