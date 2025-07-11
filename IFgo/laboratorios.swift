import Foundation

public struct Laboratorio: Codable, Identifiable {
    init(nome: String, andar: Int, bloco: String, responsavel: String, horario: String, descricao: String){
        self.nome = nome
        self.andar = andar
        self.bloco = bloco
        self.responsavel = responsavel
        self.horario = horario
        self.descricao = descricao
    }
    
    
    public var id: String { nome }
    public let nome: String
    public let andar: Int
    public let bloco: String
    public let responsavel: String
    public let horario: String
    public let descricao: String
}

public final class LaboratorioData {
    public static let shared = LaboratorioData()

    public let laboratorios: [Laboratorio]

// json com os laboratorios do bloco de pesquisa
    private let jsonString = """
    [
        {
            "nome": "LPQA",
            "andar": 1,
            "bloco": "BP",
            "responsavel": "Fabio Caetano",
            "horario": "8h - 21h, segunda à sexta",
            "descricao": ""
        },
        {
            "nome": "LERCA",
            "horario": "7:30 - 17:00, segunda à sexta",
            "responsavel": "Andréa Cysne",
            "descricao": "Trabalho de pesquisas ambientais, energias renováveis e sustentabilidade.",
            "andar": 1,
            "bloco": "BP"
        },
        {
            "nome": "LMG",
            "andar": 1,
            "bloco": "BP",
            "responsavel": "Marcos Porto",
            "horario": "7:30h - 17h, segunda à sexta",
            "descricao": "O Laboratório de Modelagem Geotécnica (LMG) tem como objetivo auxiliar as disciplinas de Geotecnia dos cursos de Engenharia Civil, Edificações, Estradas e Saneamento com o desenvolvimento de modelos numéricos, físicos e materiais de aula."
        },
        {
            "nome": "LMC",
            "andar": 1,
            "bloco": "BP",
            "responsavel": "Indisponível",
            "horario": "Indisponível",
            "descricao": "Indisponível"
        },
        {
            "nome": "LAPADA",
            "andar": 2,
            "bloco": "BP",
            "responsavel": "Anaxa Goras, Mauro Oliveira e Reinaldo",
            "horario": "7:30h - 18:30h, segunda à sexta",
            "descricao": "Espaço para desenvolvimento/pesquisa para bolsistas"
        },
        {
            "nome": "LIA",
            "andar": 2,
            "bloco": "BP",
            "responsavel": "Ajalmar",
            "horario": "7:30h - 20:00h, segunda à sexta",
            "descricao": "Desenvolvimento de projetos de inovação da EMBRAPII envolvendo back-end e front-end"
        },
        {
            "nome": "LAPISCO",
            "andar": 2,
            "bloco": "BP",
            "responsavel": "Pedro Pedrosa",
            "horario": "7:30h - 20:00h, segunda à sexta",
            "descricao": "O Laboratório de Processamento de Imagens, Sinais e Computação (LAPISCO) concentra suas áreas de pesquisa principalmente em Processamento Digital de Imagens, Sinais e Computação Aplicada em diversas áreas envolvendo Inteligência Artificial e aprendizado de máquina."
        },
        {
            "nome": "LDS",
            "andar": 3,
            "bloco": "BP",
            "responsavel": "Antônio Barros Serra",
            "horario": "8h - 17h, segunda à sexta",
            "descricao": "Embarca Tech. Projeto de ensino voltado para sistemas embarcados."
        },
        {
            "nome": "GDESTE",
            "andar": 3,
            "bloco": "BP",
            "responsavel": "Jorge Frederickson, Carlos Maurício",
            "horario": "8h - 18h, segunda à sexta",
            "descricao": "Desenvolvimento de sistemas embarcados, desenvolvimento full-stack e modelagem e impressão 3D."
        },
        {
            "nome": "LPDS",
            "andar": 3,
            "bloco": "BP",
            "responsavel": "Auzir Ripardo",
            "horario": "7:30h - 22h, segunda à sexta",
            "descricao": "Pesquisa e desenvolvimento de sistemas embarcados voltados para fisioterapia"
        },
        {
            "nome": "Fotônica",
            "andar": 3,
            "bloco": "BP",
            "responsavel": "Glendo de Freitas",
            "horario": "7:30h - 20h, segunda à sexta",
            "descricao": "Sensoriamento Óptico, desenvolvimento de sensores ópticos. Nano-estrutura nanofotônica, IA, comunicações ópticas, sistemas embarcados e química."
        },
        {
            "nome": "Apple Academy (Campfire)",
            "andar": 4,
            "bloco": "BP",
            "responsavel": "Carlos Hairon, Antônio Barros Serra",
            "horario": "8h - 18h, segunda à sexta",
            "descricao": "Laboratório Apple focado em desenvolvimento de aplicativos para os dispositivos Apple."
        },
        {
            "nome": "Apple Academy (Sandbox)",
            "andar": 5,
            "bloco": "BP",
            "responsavel": "Carlos Hairon, Antônio Barros Serra",
            "horario": "8h - 18h, segunda à sexta",
            "descricao": "Laboratório Apple focado em desenvolvimento de aplicativos para os dispositivos Apple."
        }
    ]
    """
//    Tenta decodificar o json, se conseguir, armazena os dados em `laboratorios`, caso contrário, inicializa `laboratorios` como um array vazio.
    public init() {
        let data = Data(jsonString.utf8)
        do {
            laboratorios = try JSONDecoder().decode([Laboratorio].self, from: data)
        } catch {
            print("Erro ao decodificar Laboratorios.json: \(error)")
            laboratorios = []
        }
    }
}

