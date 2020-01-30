class Translation
  DNA = { 
    'Methionine' => ['AUG'], 
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'],
    'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'],
    'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'],
    'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_rna(str)
    array = str.scan(/.../).map { |codon| of_codon(codon) }
    array.find_index('STOP') ? array[0..(array.find_index('STOP') - 1)] : array
  end

  def self.of_codon(str)
    codon = DNA.select { |k, v| v.include? str }.keys.first
    raise InvalidCodonError if codon.nil?
    codon
  end
end

class InvalidCodonError < StandardError; end

