//
//  laboratorios.swift
//  IFgo
//
//  Created by found on 08/07/25.
//

import Foundation

public struct Laboratorios
{
    var nome: String
    var andar: Int
    var bloco: String
    var responsavel: String
    var horario: String
    var descricao: String
}

public var json = """
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
        "andar": "1",
        "bloco": "BP"
    },
    {
        "nome": "LMG",
        "andar": 1,
        "bloco": "BP",
        "responsavel": "Marcos Porto",
        "horario": "7:30h - 17h, segunda à sexta",
        "descricao": "O Laboratório de Modelagem Geotécnica (LMG) tem como objetivo auxiliar as disciplinas de Geotecnia dos cursos de Engenharia Civil, Edificações, Estradas e Saneamento com o desenvolvimento de modelos numéricos, físicos e materiais de aula.
            "
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
        "responsavel": "Glendo de Freitas,
        "horario": "7:30h - 20h, segunda à sexta",
        "descricao": "Sensoriamento Óptico, desenvolvimento de sensores ópticos.
            Nano-estrutura nanofotônica, IA, comunicações ópticas, sistemas embarcados e química."
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


