import bcrypt from 'bcryptjs';

try {
    process.loadEnvFile();
} catch {
    console.error('   ❌ parceria ... arquivo .env não encontrado');
    process.exit(1);
}

const { criptografar } = await import('../src/lib/cripto.js');
const { prisma } = await import('../src/lib/prisma.js');

// para ter mais linhas no banco, acrescente mais objetos em cada lista/tabela
const dados = {
    usuario: [{ nome: 'admin', senha: bcrypt.hashSync('admin123', 10) }, { nome: 'maria', senha: bcrypt.hashSync('123', 10) }, { nome: 'joao', senha: bcrypt.hashSync('321', 10) }],
    cliente: [{ nome: 'Bagui', cpf: criptografar('123.456.789-01')}, { nome: 'Arthur', cpf: criptografar('492.071.528-51') }, { nome: 'Rafaela', cpf: criptografar('491.952.888-48')}],
    veiculo: [{ modelo: 'Corsa', cliente_id: 1 }, { modelo: 'Celta', cliente_id: 2 }, { modelo: 'Agile', cliente_id: 3 }],
    agendamento: [{ data: new Date('2026-11-10'), veiculo_id: 1 }, { data: new Date('2026-11-11'), veiculo_id: 2 }, { data: new Date('2026-11-12'), veiculo_id: 3 }],
};

const tabelas = Object.keys(dados).reverse().join(', ');
await prisma.$executeRawUnsafe(`TRUNCATE TABLE ${tabelas} RESTART IDENTITY CASCADE`);
console.log('   🧹 registros anteriores apagados (ids reiniciados)');

for (const [tabela, data] of Object.entries(dados)) {
    const { count } = await prisma[tabela].createMany({ data });
    console.log(`   ✅ ${tabela}: ${count} registros`);
}

await prisma.$disconnect();
