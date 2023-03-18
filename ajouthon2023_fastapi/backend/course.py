import asyncio

from tortoise import fields, models, Tortoise


class Courses(models.Model):
    id = fields.IntField(pk=True)
    uuid = fields.CharField(max_length=10)  # 과목 코드. (ex: SCE102)
    department = fields.IntField()  # 학과 구분. 0: 소프트웨어학과
    type = fields.IntField()  # 과목 종류. 0: 교양 필수, 1: 전공 필수, 2: 전공 선택
    name = fields.CharField(max_length=50)  # 과목 이름.
    credit = fields.IntField()  # 학점.
    time = fields.IntField()  # 주 당 시간.
    grade = fields.IntField()  # 권장 학년. 1: 1-1, 2: 1-2, 3: 2-1 ...
    summary = fields.CharField(max_length=1000)  # 과목 설명
    prerequisite = fields.JSONField()  # 선수 과목

    class Meta:
        table = 'courses'


async def setup():
    # 데이터베이스 연결 설정
    await Tortoise.init(
        db_url="sqlite://database.db",
        modules={"models": ["__main__"]}
    )

    # 데이터베이스 생성 및 테이블 생성
    await Tortoise.generate_schemas()


async def main():
    pass


async def initialize():
    await setup()

    # 1학년 1학기
    await Courses.create(uuid='KOR101',
                         department=0,
                         type=0,
                         name='글쓰기',
                         credit=3,
                         time=3,
                         grade=1,
                         summary='어법에 맞는 문장을 구사하는 작문의 기초부터, 창의력과 논리적인 사고가 요구되는 논문 작성법에 이르기까지 단계적으로 구성된다. 이를 통해 작문 수준을 스스로 진단하고 문제를 해결하는 능력을 기를 수 있다.',
                         prerequisite=[])

    await Courses.create(uuid='CAJO113',
                         department=0,
                         type=0,
                         name='아주인성',
                         credit=1,
                         time=1.5,
                         grade=1,
                         summary='대학인과 민주시민으로서 갖추어야 할 덕에 관한 정기성찰의 기회를 제공하기 위해 설계된 과목으로 동영상 강의와 오프라인 강의로 구성되어 있다.',
                         prerequisite=[])

    await Courses.create(uuid='ENG112',
                         department=0,
                         type=0,
                         name='영어2',
                         credit=3,
                         time=3,
                         grade=1,
                         summary='The primary goal of this course is to provide students with the opportunity to improve their reading and listening skills in English. The course tries to help students acquire the high English proficiency which is nowadays a prerequisite for survival in the increasingly competitive global village. They can also increase their awareness of North American and other cultures by reading articles on a wide range of significant contemporary issues.',
                         prerequisite=[])

    await Courses.create(uuid='SCE191',
                         department=0,
                         type=0,
                         name='SW커리어세미나',
                         credit=1,
                         time=1,
                         grade=1,
                         summary='대학 1학년생을 위한 과목으로 컴퓨터공학 및 소프트웨어 분야의 전문가로서 대학 재학 기간 동안의 커리어 개발을 할 수 있도록 지원하기 위한 과목이다. 전임 교수진 및 졸업생등 외부 전문가들의 특강 위주로 진행한다. 수업 참여도를 주 평가요소로 하여 pass-fail로 성적을 부여한다.',
                         prerequisite=[])

    await Courses.create(uuid='MATH102',
                         department=0,
                         type=0,
                         name='수학1',
                         credit=3,
                         time=3,
                         grade=1,
                         summary='미적분학의 기본적인 중요사항들 중에서 고등학교과정에 포함되지 않은 내용을 주로 다룬다. 개념을 엄밀히 하고 부족한 부분을 철저히 보강함으로써 앞으로의 수학 및 전공 수업에 어려움이 없게 한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE103',
                         department=0,
                         type=1,
                         name='컴퓨터프로그래밍및실습',
                         credit=4,
                         time=5,
                         grade=1,
                         summary='컴퓨터 프로그래밍은 C와 같은 컴퓨터 프로그래밍 언어로 컴퓨터 소프트웨어를 작성하는 작업을 일컫는다. 어느 정도 실용적인 프로그램의 작성이 가능하려면 프로그래밍 언어에 대한 해박한 지식을 갖추어야 함은 물론 프로그램 개발 방법에 대하여도 숙지하여야 한다. 이 과목에서는 컴퓨터 프로그래밍을 처음 시작하는 사람을 대상으로, 대표적인 컴퓨터프로그래밍언어인 C언어에 대한 문법체계를 배우고, 프로그래밍언어로 문제를 해결하기 위해 필요한 분석 및 설계 기법에 대하여도 배운다. 프로그램설계 과제를 통하여 소프트웨어 설계능력과 실용적인 프로그래밍 능력을 배양한다.',
                         prerequisite=[])


    # 1학년 2학기
    await Courses.create(uuid='ENG111',
                         department=0,
                         type=0,
                         name='영어1',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='This course satisfies one half of the basic English requirement for all undergraduate students. Focusing on the productive skills, speaking and writing, the primary objective of this course is helping ',
                         prerequisite=[])

    await Courses.create(uuid='MATH103',
                         department=0,
                         type=0,
                         name='수학2',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='수학1의 연속강의로 일변수에 관한 사항들을 벡터를 도입하여 다변수로 확장하는 것을 주로 다룬다.',
                         prerequisite=[])

    await Courses.create(uuid='PHYS119',
                         department=0,
                         type=0,
                         name='물리학',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='물리학을 상대적으로 덜 필요로 하는 이공계 학생들을 위한 기초과목으로 역학과 전자기학을 중심으로 전반적인 물리학 분야를 한 학기에 집약하여 배우게 된다. 가능한 한 복잡한 수식을 지양하고 개념 중심의 강의가 진행되며 이공계학도로서 전공분야를 익힐 수 있는 기본소양의 배양과 자연현상에 대한 폭 넓은 이해를 도울 것이다.',
                         prerequisite=[])

    await Courses.create(uuid='BIO111',
                         department=0,
                         type=0,
                         name='생명과학',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='자연과학부 1학년생을 대상으로 생물학의 전 분야를 소개하는 입문 강좌이다. 생리, 형태, 유전, 분류 및 다양성을 기본 주제로 하여 생물에 대한 기초개념에서부터 분야별 최신 정보에 이르기까지 다양한 지식을 습득한다.',
                         prerequisite=[])

    await Courses.create(uuid='PHYS118',
                         department=0,
                         type=0,
                         name='물리학실험',
                         credit=1,
                         time=2,
                         grade=2,
                         summary='역학을 중심으로 물리학의 원리를 실증적으로 이해하고 응용력을 키우며, 과학기술분야의 실험보고서를 효과적으로 작성할 수 있도록 훈련한다. 물리학은 자연과학 및 공학의 기반을 이루고 있으므로 이에 대한 충실한 이해는 이학, 공학 및 의학을 공부하는 데 있어서 필수불가결 한 요소이다.',
                         prerequisite=[])

    await Courses.create(uuid='BIO114',
                         department=0,
                         type=0,
                         name='생명과학실험',
                         credit=1,
                         time=2,
                         grade=2,
                         summary='생물체를 대상으로 한 실험, 실습을 통해 생물학에 대한 이해를 돕는다. 현미경 사용법, 생체고분자 검색법, 염색체분리 및 유전자 조작법 등의 실험과정을 이수하면서 실험방법, 실험 데이타의 분석 및 해석 등을 습득한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE104',
                         department=0,
                         type=1,
                         name='인공지능입문',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='소프트웨어 분야에서 인공지능에 대한 수요가 크게 높아짐에 따라 소프트웨어 계열 학과의 학생들이 재학 중에 관련한 학습과 탐구 활동이 이루어져야 할 것으로 예상된다. 이에 따라, 1학년 과정에 인공지능에 대한 개괄적인 이해를 도모하기 위해 본 과목을 운영하고, 본 과목에서 배운 이해를 기반으로 3,4학년 과정에서 인공지능 이론을 심층적으로 학습하게 하고자 한다. 본 과목은 크게 네 부분으로 나누어진다. 인공지능 기술에 대한 개괄적인 소개를 하고, 인공지능 알고리즘 실행에 가장 많이 사용되는 프로그래밍 언어인 파이썬을 학습한다. 또한, 인공지능을 활용한 서비스를 창의적으로 설계하는 경험을 통해 창의적인 문제 해결 경험뿐만 아니라 재학 중에 심화 학습이 필요함을 깨닫는 기회를 갖게 하고, 2,3,4학년 과정에서 학습할 주제들 중에 인공지능과 관련이 있는 주요 기술 분야에 대한 개괄적인 소개를 제공한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE112',
                         department=0,
                         type=1,
                         name='디지털회로',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='컴퓨터 및 디지털 시스템의 기본 조직의 구성에 필요한 하드웨어 분야의 디지털 회로를 다룬다. 컴퓨터 및 디지털 시스템의 기본을 이루는 요소들, 즉 조합회로와 순차회로를 중심으로 한 기본 디지털 회로를 배운다. ',
                         prerequisite=[])

    await Courses.create(uuid='SCE141',
                         department=0,
                         type=1,
                         name='이산수학',
                         credit=3,
                         time=3,
                         grade=2,
                         summary='이산수학은 유한하고(finite) 셀 수 있는(countable or numerable) 집합으로 대상을 국한하여 실제 생활에서 접하는 문제들을 해결하기 위한 방법들을 주요 연구대상으로 한다. 이 때, 주어진 문제의 크기가 사람이 손으로 직접 풀기에는 너무 복잡하고 크다는 가정 하에서 컴퓨터의 활용은 필수적이며, 컴퓨터가 문제를 해결할 수 있도록 하기 위한 수학적인 이론이나 원리, 행렬이나 그래프 등과 같은 다양한 문제표현방법, 그리고 그에 따른 풀이 방법과 알고리즘 설계등을 다룬다. 이산수학은 학생들이 이수할 주요 전공과목의 학습내용과 대부분 관련이 있는 중요한 선수과목으로서 컴퓨터 프로그래밍, 컴퓨터기본구조, 컴퓨터통신 등과 같은 과목의 예제들을 다루고 있다. 특히 자료구조, 계산이론, 정보보호개론 과목의 선수 과목으로 지정되어 있으며, 본격적으로 전공 공부를 시작하기에 앞서 이수해야 할 과목 중의 하나이다.',
                         prerequisite=[])


    # 2학년 1학기
    await Courses.create(uuid='SCE204',
                         department=0,
                         type=1,
                         name='객체지향프로그래밍및실습',
                         credit=4,
                         time=5,
                         grade=3,
                         summary='객체지향 프로그래밍 언어의 기본 구성 요소인 객체와 클래스, 상속 등의 개념과 이들을 활용하여 프로그래밍 하는 기법을 배운다. 객체지향프로그래밍의 핵심 개념인 데이터 추상화, 캡슐화, 다형성 등을 공부하고, 이들로 하여금 객체지향 프로그램이 어떻게 소프트웨어의 재사용과 확장성을 제공하는지에 대해서도 공부한다. 이 과목에서는 가장 널리 사용되는 객체지향 언어 중의 하나인 C++ 혹은 Java 언어를 이용하여 이러한 객체지향적인 개념을 공부한다. 학생들은 선호도에 따라 언어를 선택하여 수강할 수 있다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE205',
                         department=0,
                         type=1,
                         name='자료구조',
                         credit=3,
                         time=3,
                         grade=3,
                         summary='본 과목에서는 컴퓨터를 사용해서 개발하는 시스템에서 사용되는 자료구조의 종류와 이를 사용하는 방법론에 대해서 배우게 된다. stack, queue, tree, graph, hashing, sorting, search structure 등의 자료구조를 다룬다. 본 과목에서 배우는 자료구조와 자료구조 활용방법에 대한 이해는 추후에 수강하게 되는 모든 컴퓨터 관련 과목의 중요한 기초 지식이다. ',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE212',
                         department=0,
                         type=1,
                         name='컴퓨터구조',
                         credit=3,
                         time=3,
                         grade=3,
                         summary='간단한 논리회로부터 Decorders, Registers, Counters등은 물론 Memory Units에 이르기까지 각종 디지털요소 (Component)들의 작동원리와 특성을 알아보고, 컴퓨터에서의 데이터 표현방법을 학습한다. 이러한 지식을 토대로 컴퓨터 명령어가 어떻게 구성이 되는지의 원리와 이해를 위해 가상 기본 컴퓨터의 명령어를 예로 제시한다. 이러한 명령어를 구현하기 위한 방식으로 하드웨어 제어와 마이크로프로그램 제어 방식의 구조를 마이크로 오퍼레이션 수준까지 상세히 살펴본다. 또한 가상적으로 정의된 컴퓨터 시스템을 이용하여 어떻게 프로그램이 작성되고 실행되는지를 기계어 수준 프로그램 예를 통해 이해한다. 아키텍쳐 수준의, 좀 더 세분화된 구성으로서, CISC와 RISC 방식의 명령어 비교 및 어드레스 모드 등을 살펴보고, 성능 개선을 위한 구현 방법으로서 파이프라인 방식의 원리 및 개선 수준 등을 학습한다. 또한 입출력 장치의 구성과 이를 제어하기 위한 기본 원리 등을 학습한다.',
                         prerequisite=["SCE103"])


    # 2학년 2학기
    await Courses.create(uuid='PHYS119',
                         department=0,
                         type=0,
                         name='물리학',
                         credit=3,
                         time=3,
                         grade=4,
                         summary='물리학을 상대적으로 덜 필요로 하는 이공계 학생들을 위한 기초과목으로 역학과 전자기학을 중심으로 전반적인 물리학 분야를 한 학기에 집약하여 배우게 된다. 가능한 한 복잡한 수식을 지양하고 개념 중심의 강의가 진행되며 이공계학도로서 전공분야를 익힐 수 있는 기본소양의 배양과 자연현상에 대한 폭 넓은 이해를 도울 것이다.',
                         prerequisite=[])

    await Courses.create(uuid='CHEM111',
                         department=0,
                         type=0,
                         name='화학',
                         credit=3,
                         time=3,
                         grade=4,
                         summary='화학을 전공하지 않는 공학부 학생들에게 제공되는 과목으로 화학에 대한 사전지식이 없이도 수강 가능하다. 화학적 사실로부터 화학이론으로 유도되는 연관 있는 일들과 화학이론을 기초로 한 물질들의 독창적인 조작을 이해하게 된다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE214',
                         department=0,
                         type=1,
                         name='시스템프로그래밍및실습',
                         credit=4,
                         time=5,
                         grade=4,
                         summary='본 교과목에서는 시스템 소프트웨어를 구성하는 어셈블러, 링커, 로더, 운영체제 디바이스 드라이버에 관한 이론적 사항을 공부하고 이들을 조합하여 설계할 수 있는 능력을 키운다. 즉, 어셈블리 언어를 익힌 후 이를 이용한 여러 프로그래밍 기법을 터득하고, 링커 및 로더에 대한 기초적인 개념 및 설계방법을 파악하도록 한다. 본 과목은 체계적이고 실제적인 실습 교육을 병행한다. 어셈블러, 로더, Cross compiler, 운영체제 디바이스드라이버 등 다양한 시스템 소프트웨어를 임베디드 리눅스 시스템 환경에서 직접 구현해 봄으로써 임베디드 시스템 환경에 대한 기초 지식과 실무 경험을 갖추도록 한다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE231',
                         department=0,
                         type=1,
                         name='알고리즘',
                         credit=3,
                         time=3,
                         grade=4,
                         summary='컴퓨터 알고리즘의 디자인과 분석을 위한 원리와 기법을 학습하여 실제의 문제들을 해결하는 효율적인 알고리즘들을 설계하고 구현할 수 있는 능력을 키운다. 수학적 귀납법, 점근적 분석(asymptotic analysis) 등의 기본 원리와 분할정복, 동적계획법, 그리디 방법, 분지한정, 퇴각검색 등의 디자인 기법과 기초적인 계산복잡도 이론을 공부한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE221',
                         department=0,
                         type=1,
                         name='컴퓨터네트워크',
                         credit=3,
                         time=3,
                         grade=4,
                         summary='본 과목은 TCP/IP 프로토콜을 중심으로 데이터링크, 네트워크, 트랜스포트, 애플리케이션 계층의 표준 인터넷 프로토콜을 이해한다. 여기에는 ARP, IP, RIP, ICMP, TCP,UDP에, TELNET, FTP, HTTP, SMTP, 및, DNS 등의 프로토콜이 포함되며, 이들 프로토콜 각각의 동작과 함께 상호 간의 작용을 종합적으로 공부한다. 이 과목의 목적은 인터넷 구조, 프로토콜 및 관련 어플리케이션에 대한 전반적인 이해를 도울 것이다. 계층적 구조를 기반으로 컴퓨터 네트워킹을 이해하고 지금까지 인터넷을 사용자 입장에서 사용하였지만 실제적으로 어떻게 인터넷이 동작되는가를 배울 것이다. ',
                         prerequisite=[])


    # 3학년 1학기
    await Courses.create(uuid='SCE213',
                         department=0,
                         type=1,
                         name='운영체제',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='본 강의에서는 운영체제가 무엇이며, 운영체제 내에서 어떠한 문제가 발생하며, 그러한 문제는 어떠한 방법으로 해결되고 있는가 등을 배우게 될 것이다. 운영체제에서 다루어지는 기법들은 단순히 운영체제 내에서만 이용되는 것은 아니다. 예를 들면, thread를 이용하는 프로그램의 작성에 있어서 동기화는 매우 중요한 기술을 요구하고 있으며, 운영체제를 이수한 학생은 이러한 기술을 자연스럽게 배양하는 계기가 될것이다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE3315',
                         department=0,
                         type=2,
                         name='기계학습',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='이 수업에서는 기계 학습의 기본 개념과 주요 알고리즘을 소개한다. 탐색적 데이터 분석, 지도학습 (분류, 회귀) 및 비지도학습 (군집화, 차원축소 등) 방식, 모델 선택을 위한 평가 방법 등을 다루게 된다. 구체적인 알고리즘으로 SVM, KNN, 앙상블 모델, 선형/로지스틱/정규화된 회귀 모델, k-평균 / 계층적 클러스터링, 인공신경망 및 CNN, RNN, Autoencoder, GAN과 같은 딥러닝 모델을 포함한다. 자연어 처리, 컴퓨터 비전 및 의생명정보학 분야의 최근 머신 러닝 응용들과 기술 동향도 같이 소개한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SOS344',
                         department=0,
                         type=2,
                         name='네트워크보안및실습',
                         credit=3,
                         time=4.5,
                         grade=5,
                         summary='본 교과목에서는 인터넷 보안의 목표와 그 목표를 달성하기 위한 각 계층별 보안 프로토콜을 이론적으로 배우고 또한 실습한다. 주요 교육내용은 TLS와 IPsec의 기본이 되는 PKI에 대해 배우고, TLS와 IPsec의 주요 원리 및 프로토콜을 학습한다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE327',
                         department=0,
                         type=2,
                         name='네트워크소프트웨어',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='소프트웨어융합 도메인에서 네트워크응용을 위하여 요구되는 임베디드 모바일 시스템을 기반으로 한 프로그래밍 방법론에 대하여 공부한다. 소프트웨어융합 도메인에서 적용을 위한 네트워크 소프트웨어의 구조 설계 방법, 이를 가능하게 하는 네트워크 프로토콜의 설계, 그리고 이를 구현하기 위한 프로그래밍 방법을 공부한다. 실습에서는 네트워크소프트웨어 교과목의 내용의 실질적인 이해와 이의 응용 능력을 배양하기 위하여, 모바일 임베디드시스템을 대상으로 응용 프로그램들을 직접 작성한다.',
                         prerequisite=["SCE221"])

    await Courses.create(uuid='SCE333',
                         department=0,
                         type=2,
                         name='데이터베이스',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='데이터베이스는 방대한 크기의 데이터를 컴퓨터에 저장하고 필요한 데이터를 얻어오는 기법에 대한 것으로 컴퓨터 응용프로그램에서 컴퓨터 시스템에 이르기까지 영향을 미치는 전산학에서 매우 중요한 분야이다. 본 교과에서는 데이터베이스 전반에 대한 이해를 목표로 하며 특히 사용자 입장에서 데이터베이스 시스템을 다루는 것에 중점을 둔다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE334',
                         department=0,
                         type=2,
                         name='정보보호',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='정보통신 시스템, 네트워크를 통하여 정보 처리를 수행하는 것은 현대 사회의 기본 조건이다. 이 기본 조건이 발전되고 심화됨에 따라 정보처리를 역기능 없이 안전하게 (Secure) 수행할 수 있어야 함은 선택이아닌 필수요건이 되었다. 어떠한 정보 처리 환경이 되더라도 안전한 정보 처리를 행하는 데에 공통적인 기본 기술 요소들이 존재한다. 이 과목에서는 다양한 Security 공통 기본 기술들을 숙지함으로써 그 후에 수요에 따라 어떤 고급 정보 처리 응용 분야에서도 필요한 정보보호 기능을 설계, 개발, 운용, 사용, 관리할 수 있는 능력을 구비할 수 있도록 한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SOS337',
                         department=0,
                         type=2,
                         name='시스템소프트웨어보안',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='본 교과목은 소프트웨어 기반 보안 시스템, 웹기반 운영체제 플랫폼 및 무선 통신 소프트웨어 기술 보안, 응용서비스 및 컨텐츠 보안에 관한 다양한 주제를 다룬다. 즉, 임베디드 리눅스 혹은 안드로이드와 같은 모바일 OS에서의 소프트웨어 관련 보안, NFC, 무선랜 와이파이 등에서의 응용 소프트웨어보안, 클라이언트와 모바일 웹, 모바일 기기 소프트웨어 보안에 대한 최근 이슈 등을 학습함으로써 소프트웨어 기반 보안에 대한 전반적인 기초 및 응용 능력을 키운다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE331',
                         department=0,
                         type=2,
                         name='오픈소스SW입문',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='본 교과목은 오픈소스 SW 개발자로의 기초 역량 양성을 목표로 한다. 이를 위해 오픈소스 SW의 정의 및 철학에 대해 학습하고, 오픈소스 SW를 활용한 다양한 서비스와 플랫폼 사례들을 조사하며, 이를 통해 오픈소스 SW 개발의 의미를 이해한다. 오픈소스 SW 라이센스와 소스 코드 버전 관리, 버그 트래킹과 같은 오픈소스 SW 개발에 필요한 지식을 학습하며, 이슈등록, 코드리뷰 등 오픈소스 SW 개발 프로세스에 따라 오픈소스 SW에 기여하는 활동에 대해 경험해 봄으로 오픈소스 SW 개발자로의 기초 역량을 배양한다. 본 교과목을 시점으로 하여 학생들은 추후 개설되는 교과목에서 오픈소스 SW 프로젝트를 추진하게 되고 기여자로서의 역량을 배양하게 될 것이다.',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SCE322',
                         department=0,
                         type=2,
                         name='컴퓨터통신',
                         credit=3,
                         time=3,
                         grade=5,
                         summary='본 과목에서는 컴퓨터공학전공에서 제공되는 정보통신 관련 교과목들의 수강에 필요한 기본 지식을 다룬다. 이를 위하여 본 과목에서는 정보 통신을 공부하는 데 기본이 되는 데이터통신과 컴퓨터네트워크의 기본 이론을 위주로 다음과 같은 내용을 배운다. - 데이터통신의 기본원리 및 OSI와 TCP/IP 계층화구조 - 전송 매체의 종류 및 특징, 데이터인 코딩과 관련된 물리 계층의 기능 - 데이터링크 제어, 오류제어, 다중화 등과 관련된 데이터 링크 계층의 기능 - Circuit 및 Packet 스위칭, 라우팅과 관련된 네트워크 계층의 기능 - 유무선 LAN 및 WAN의 개념 및 Interworking 원리',
                         prerequisite=[])


    # 3학년 2학기
    await Courses.create(uuid='SCE3313',
                         department=0,
                         type=2,
                         name='데이터마이닝',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='데이터마이닝은 방대한 양의 데이터에서 유용한 패턴을 찾기 위한 이론과 기술을 지칭하며 웹 분석, 추천 시스템, 사이버 보안 등 주요한 애플리케이션에서 사용되고 있다. 본 수업에서는 데이터마이닝의 기초 알고리즘과 이론을 배우고 이를 이용한 프로젝트를 설계하고 수행한다. 주요 주제로 유사한 항목 찾기, 빈번한 패턴마이닝, 링크 분석, 추천 시스템, 데이터 스트림마이닝, 그래프마이닝, 시계열 예측 및 이상 값 감지가 포함됩니다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE392',
                         department=0,
                         type=2,
                         name='IT전문영어',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='IT English is a course that concentrates on English with an Information Technology focus. Speaking lessons include pair work, small group tasks and class discussions. Students will gain confidence and improve their English speaking abilities by practicing expressions and dialogues and making their own presentations. Students will do IT activities and also learn to produce a IT Business Proposal.',
                         prerequisite=["ENG112", "ENG112"])

    await Courses.create(uuid='SCE393',
                         department=0,
                         type=2,
                         name='IT집중교육1',
                         credit=6,
                         time=8,
                         grade=6,
                         summary='전공기초 이론 및 설계, 실험 및 실습을 융합한 전공심화 과정의 일환으로 실무형 전문 엔지니어 양성을 목표로 한다. IT집중교육1과 IT집중교육2가 연속적으로 진행되며, 팀 단위 프로젝트를 수행하는 것을 원칙으로 한다. 본 과목의 주제는 실제 산업체에서 활용 가능한 기술 주제를 선정하며, 매 학기 변경될 수 있다. 각 과목 당 2개월 동안 매 주 4일 동안 매일 8시간(강의 3시간 +실습 5시간) 형식으로 운영된다. 강의 시간에는 프로젝트 수행에 필요한 기반이 되는 이론을 학습하며 실습 시간에 실제 개발을 위해 필요한 기능을 익히고 개발을 진행한다.',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SCE394',
                         department=0,
                         type=2,
                         name='IT집중교육2',
                         credit=6,
                         time=8,
                         grade=6,
                         summary='전공기초 이론 및 설계, 실험 및 실습을 융합한 전공심화 과정의 일환으로 실무형 전문 엔지니어 양성을 목표로 한다. IT집중교육1과 IT집중교육2가 연속적으로 진행되며, 팀 단위 프로젝트를 수행하는 것을 원칙으로 한다. 본 과목의 주제는 실제 산업체에서 활용 가능한 기술 주제를 선정하며, 매 학기 변경될 수 있다. 각 과목 당 2개월 동안 매 주 4일 동안 매일 8시간(강의 3시간 +실습 5시간) 형식으로 운영된다. 강의 시간에는 프로젝트 수행에 필요한 기반이 되는 이론을 학습하며 실습 시간에 실제 개발을 위해 필요한 기능을 익히고 개발을 진행한다.',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SCE335',
                         department=0,
                         type=2,
                         name='계산이론',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='이 과목에서는 계산이 무엇인가에 대한 이론적인 공부를 한다. 다루는 세부주제는 오토마타(finite automata), 형식 문법(formal grammar), 형식 언어(formal language), 계산의 모델(models of computation), 계산가능/불가능(decidability/ undecidability) 등이다. 이 과목은 컴퓨터 공학/과학의 이론적인 조망을 얻을 수 있는 기본 목표 이외에 세부 주제들의 응용 지식 또한 중요한 의미를 가진다. 형식 문법은 컴파일러의 기본적 지식을 제공하며, 오토마타는 스트링 매칭 알고리즘의 기본이 된다.',
                         prerequisite=["SCE141"])

    await Courses.create(uuid='SCE3317',
                         department=0,
                         type=2,
                         name='지능형사물인터넷',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='본 과목을 통하여 학생들은 사물인터넷(Internet of Things) 시스템 전반을 이해하고 설계할 수 있는 능력을 갖게 된다. 수강생은 시스템, 네트워크 및 응용 소프트웨어에 관한 전공기초 지식 및 개발 역량을 갖추고 있어야 하는데 이는 사물 인터넷 시스템이 임베디드 및 서버/클라우드 시스템, 유무선 네트워크, 빅데이터 처리 및 관리, 지능형플랫폼 등의 복합적인 구성요소를 갖춘 융합시스템이기 때문이다.',
                         prerequisite=["SCE213"])

    await Courses.create(uuid='SOS339',
                         department=0,
                         type=2,
                         name='블록체인과 IoT',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='본 과목은 블록체인과 분산원장, 그리고 블록체인 응용 기반기술로서 IoT보안의 기본지식을 배운다. 주요 강의 내용은 블록체인및 분산원장의 기본원리, 블록체인 보안, 비트코인, 이더리움 등의 주요 블록체인에 대한 이해, 스마트계약, NFT, DAO, IoT 보안등이다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE3319',
                         department=0,
                         type=2,
                         name='AI집중교육1',
                         credit=6,
                         time=8,
                         grade=6,
                         summary='실전적 인공지능 교육을 위해 이론과 실습을 병행하는 교과목을 구성하고자 함. 한 학기 16주를 교수 2인이 AI집중교육 1과 2를 8주로 나누어 교육함.',
                         prerequisite=[])

    await Courses.create(uuid='SCE3320',
                         department=0,
                         type=2,
                         name='AI집중교육2',
                         credit=6,
                         time=8,
                         grade=6,
                         summary='실전적 인공지능 교육을 위해 이론과 실습을 병행하는 교과목을 구성하고자 함. 한 학기 16주를 교수 2인이 AI집중교육 1과 2를 8주로 나누어 교육함.',
                         prerequisite=[])

    await Courses.create(uuid='SCE337',
                         department=0,
                         type=2,
                         name='소프트웨어공학',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='실세계에서 사용되는 소프트웨어 관련 행위(개발 제작에서 사용까지)는 과학 차원보다는 공학 차원에서 이루어지는 것이다. 따라서 소프트웨어 관련 모든 전문가(특히 엔지니어수준)들은 공학적 가치관과 사고방식과 지혜 및 행동 원리를 가져야 한다. 본 과목에서는 소프트웨어에 관련되는 모든 행위(개발 또는 사용)를 수행함에 있어 절대적으로 필요한 공학적인 기본 사상/개념에 대해서 배우고 또한 소프트웨어 수명 주기 전 과정(분석 정의, 설계, 개발, 구축 및 운영 관리)에서 필요한 여러 가지 공학적인 방법론과 기술들에 대해서 배운다.',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SOS338',
                         department=0,
                         type=2,
                         name='디지털포렌식',
                         credit=3,
                         time=4.5,
                         grade=6,
                         summary='사이버보안학과 및 소프트웨어학과 3학년 이상의 학생들을 대상으로 이미 익혀온(3학년 1학기 개설되는 정보보호) 사이버보안 개념과 기술을 바탕으로 최근 가장 관심이 높은 디지털포렌식에 대해서 이해하고 실습 하는것을 목표로 함. 과목 전반부에서 디지털포렌식의 개요 및 절차로서 디지털포렌식 전반에 관한 이해를 제공하고 이후 웹브라우저와 같은 응용계층의 포렌식 이슈를 시작으로 Low-level의 파일시스템 포렌식까지 학습함. 관련 포렌식 주제는 실제로 사이버보안학과 대학원 ICS Lab.에서 국정원, 대검찰청, 경찰청 및 국내 주요 수사기관들과 진행한 연구과제를 기반으로 진행됨',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE3310',
                         department=0,
                         type=2,
                         name='실전코딩1',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='대학 정규 과정에서 다루지 않지만 현업 개발 현장에서 활용되는 도구들을 교육하고 인턴쉽 수행 또는 취업 시 도움이 될 수 있도록 학생들이 직접 실습을 수행하게 된다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE3311',
                         department=0,
                         type=2,
                         name='실전코딩2',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='대학 정규 과정에서 다루지 않지만 현업 개발 현장에서 활용되는 도구들을 교육하고 인턴쉽 수행 또는 취업 시 도움이 될 수 있도록 학생들이 직접 실습을 수행하게 된다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE338',
                         department=0,
                         type=2,
                         name='웹시스템설계',
                         credit=4,
                         time=5,
                         grade=6,
                         summary='본 과목에서는 분산시스템의 대표적인 사례인 인터넷을 기반으로 소프트웨어 시스템에 대한 이해를 넓히고 가장 보편적인 표준인 웹 기술을 이용하여 원하는 애플리케이션을 “쉽게”, “빨리”, 그리고 “많은 사람이 사용”할 수 있는 형태로 제작할 수 있는 능력을 함양하는 것을 목표로 한다. 이를 위해 웹 구축을 위한 클라이언트 사이드 프로그래밍 언어로 HTML5 및 스크립트 언어의 개념과 문법, 활용지식들을 습득하며, 동적인 웹페이지 설계를 위한 Servlet, JSP등의 서버 사이드 프로그래밍 활용에 대해 학습한다. 학습된 세부 지식을 기반으로 Ajax 스타일등의 최신 인터넷 애플리케이션 제작 및 클라우드 컴퓨팅과 관련된 실습 프로젝트를 수행한다. 본 과목에서 학습된 서버 사이드 프로그래밍 기술은 독립적인 앱 형태의 애플리케이션 제작에 응용되는 형태 등으로 다양하게 활용이 된다.',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SCE312',
                         department=0,
                         type=2,
                         name='임베디드소프트웨어',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='본 과목에서는 임베디드 소프트웨어의 설계, 구현, 디버깅 및 응용을 할 수 있는 기술을 익힌다. 이를 위해 다양한 임베디드 시스템을 대상으로 시스템초기화, 임베디드 운영체제, 디바이스 제어, 임베디드 응용의 디버깅 및 테스팅 등을 다룬다. 특히 32/8비트 임베디드 시스템에서 안드로이드 OS, 임베디드 리눅스, MicroC/OS-II, 8비트 OS 등 임베디드(실시간) 운영체제들의 특징, 구조, 그리고 응용 등을 다루어 본다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE313',
                         department=0,
                         type=2,
                         name='컴파일러',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='컴파일러 구축을 위한 제반 이론 및 구현 기법을 습득하고 이를 이용하여 간단한 컴파일러를 실제 구축한다. 컴파일러 구성의 기본이 되는 lexical analysis, parsing, code generation 등의 핵심이론을 배우고 이를 구축하는 데에 필요한 lex, yacc 등의 도구의 활용법을 배운다. 또한 이에 기반하여 간단한 프로그래밍언어에 대한 컴파일러를 실제로 개발하여 컴파일러 구축방법을 배운다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE395',
                         department=0,
                         type=2,
                         name='자기주도프로젝트',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='전공심화로 진입하기 위한 역량을 배양하고 진단하는 교과목이다. 팀을 구성하여 산업체에서 제시하는 혹은 산업체에 프로젝트 주제를 제시하여 한 학기 동안 프로젝트를 진행한다. 교과목의 책임 교수가 전체 과목 운영을 조정하고, 교수별로 협력 산업체 멘토와 함께 학생들을 지도한다. ',
                         prerequisite=["SCE204"])

    await Courses.create(uuid='SOS252',
                         department=0,
                         type=2,
                         name='현대암호이론및응용',
                         credit=3,
                         time=3,
                         grade=6,
                         summary='컴퓨터 공학 전공자에게 필요한 암호의 기초부터 암호의 적용까지를 포함하는 강의로서 암호의 기반이 되는 수학적 배경지식 강의, 암호 이론 기초 강의, 암호 프로토콜 및 어플리케이션 강의를 진행하며 세부 수업내용으로는 정수론, 암호기술 및 암호화 개요, 대칭키 암호 알고리즘, 공개키 암호 알고리즘, 암호 프로토콜(키분배 및 인증), 해쉬, MAC, PKI, 전자서명, 타원곡선 암호, 암호기술의 적용 : SSL, TLS, S/MIME, PGP등을 진행한다.',
                         prerequisite=[])


    # 4학년 1학기
    await Courses.create(uuid='SCE492',
                         department=0,
                         type=2,
                         name='SW창업론',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 과목에서는 SW 창업의 의의와 중요성을 이해하고 다양한 사례를 검토하고 성공요건을 논의한다. 첫째로, 요즈음 창조경제가 바라보는 창업트렌드를 환경 및 시대적 시각에서 검토한다. 이스라엘을 포함한 다양한 국내외 사례들을 검토하고 그에 대한 시사점을 찾는다. 둘째로, 기업가 정신을 이해하고 창업 과정, 창업 아이템, 자금조달과 운영 및 창업 법률과 세무에 대해서 실무적으로 자세히 알아본다. 셋째로, 모바일 소호 쇼핑몰, 온라인 쇼핑몰, 인터넷 경매, 공동 구매 등 다양한 창업 사례를 검토한다. 이러한 사례들 중 실패요인과 성공요인을 분석 검토한다. 넷째로, 배운 이론을 기반으로 창업을 위한 사업계획서(Business Plan) 작성을 실습한다. 사업 탸당성 분석 및 자금 조달 계획이 포함되고 투자유치 전략이 수립되어야한다. 마지막으로 각자 창업자 사업역량 자기 진단을 실시하여 자기 역량을 분석한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE495',
                         department=0,
                         type=2,
                         name='SW현장실습1',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 과목은 현장체험을 통하여 소프트웨어 지식의 활용 및 학습의 동기부여를 이루게 하는 것을 목표로 한다. 학생은 현장실습을 할 회사를 정하고 회사의 프로젝트에 참여하여 학교에서 배운 기초 지식을 응용하는 현장실습의 기회를 가지게 되며, 회사에 근무하면서 회사의 실무자와 같이 현장의 문제해결방법을 체득한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE496',
                         department=0,
                         type=2,
                         name='SW현장실습2',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 과목은 현장체험을 통하여 소프트웨어 지식의 활용 및 학습의 동기부여를 이루게 하는 것을 목표로 한다. 학생은 현장실습을 할 회사를 정하고 회사의 프로젝트에 참여하여 학교에서 배운 기초 지식을 응용하는 현장실습의 기회를 가지게 되며, 회사에 근무하면서 회사의 실무자와 같이 현장의 문제해결방법을 체득한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE497',
                         department=0,
                         type=2,
                         name='SW현장실습3',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 과목은 현장체험을 통하여 소프트웨어 지식의 활용 및 학습의 동기부여를 이루게 하는 것을 목표로 한다. 학생은 현장실습을 할 회사를 정하고 회사의 프로젝트에 참여하여 학교에서 배운 기초 지식을 응용하는 현장실습의 기회를 가지게 되며, 회사에 근무하면서 회사의 실무자와 같이 현장의 문제해결방법을 체득한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE421',
                         department=0,
                         type=2,
                         name='모바일네트워크',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 교과를 통해 학생들은 이동통신의 역사 및 개요, 모바일 네트워크의 구조 및 그 배경이 되는 스펙트럼, 채널 모델, 정보이론, 셀룰러 시스템의 개념에 대해 배운다. 4G/5G 네트워크 등 실제 이동통신의 무선 채널, 계층 구조, 접속망, 이동성 관리를 비롯하여 V2X, 스마트팩토리, 셀룰러 IoT, 보안, 인공지능 적용 등 Vertical 응용에 대해서도 학습한다.',
                         prerequisite=["SCE221"])

    await Courses.create(uuid='SCE411',
                         department=0,
                         type=2,
                         name='모델링시뮬레이션',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='시스템 분석 및 모델링, 벤치마킹, 시뮬레이션과 시스템 최적화를 위한 방법론 등 시스템 성능 분석과 관련된 주제들을 다룬다. 본 과목의 전반부에서는 CPU, I/O, O/S, Network, DBMS, 등으로 구성된 시스템 분석 및 모델링, 벤치마킹, 컴퓨터 시뮬레이션을 수행하기 위해서 필요한 시스템 모델링 방법, 모델 설계 방법, 구현 방법 등 기초 지식을 습득하도록 하고, 후반부에서는 기존의 대표적인 시스템들을 예로, 설계 및 성능분석 방법들을 살펴보고 이와 관련된 주제들을 최신 논문과 사례들을 중심으로 연구하고 학습한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE435',
                         department=0,
                         type=2,
                         name='분산시스템',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='분산 시스템이란 통신망으로 연결된 다수의 독립적인 컴퓨터들이 서로 협동하여 분산 처리를 수행하는 시스템을 말한다. 본 강의에서는 이러한 분산 시스템을 설계하고 개발하기 위한 기본 개념인 Client- Server Model,Interprocess Communication, Synchronization등을 학습하고 이를 바탕으로 분산 운영체제, 이동 컴퓨팅 등의 응용 분야에 대한 내용을 다룬다. 실습시간에는 Linux 환경에서 적용 가능한 소스 코드를 이용하여 실습함으로써 Unix 기반의 시스템 소프트웨어에 대한 활용 능력을 키운다.',
                         prerequisite=["SCE103"])

    await Courses.create(uuid='SCE493',
                         department=0,
                         type=2,
                         name='자기주도연구1',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='대학원 진학을 희망하는 학생들이 대학원 진학 전 가능한 연구 분야를 탐색하고 본격적인 대학원 과정에서의 연구를 준비하는 단계에서의 자기주도적인 연구를 해 볼 수 있는 기회를 제공한다. 4학년 2학기 자기주도연구2와 연계하여 1년 동안 지도교수, 대학원생, 산업체 멘토와 연계하여 체계적이고 실용적인 연구를 진행한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE499',
                         department=0,
                         type=2,
                         name='창업실습1',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='창업동아리 활동과 같은 창업 준비활동을 통해 학점을 이수하는 과정이다. 재학 중 창업현장실습과 통산하여 6학점 이내에서 수강하는 것을 원칙으로 한다. 교과목 수강을 희망하는 학생은 수강신청 전에 지원서를 학과장에게 제출하여 창업교육 학사제도 운영위원회의 심사를 거쳐 수강허가를 받아야 한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE4911',
                         department=0,
                         type=2,
                         name='창업현장실습1',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='창업을 하면서 학점을 이수하는 과정이다. 2학기 이상 이수자 중 정규 창업교육과정을 3학점 이상 이수한 학생에 한하여 수강하는 것을 원칙으로 한다. 재학 중 창업실습과 통산하여 6학점 이내에서 수강하는 것을 원칙으로 한다. 교과목 수강을 희망하는 학생은 수강신청 전에 지원서를 학과장에게 제출하여 창업교육 학사제도 운영위원회의 심사를 거쳐 수강허가를 받아야 한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE433',
                         department=0,
                         type=2,
                         name='컴퓨터그래픽스',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='컴퓨터 그래픽의 기본적인 개념을 다룬다. 기본 도형의 출력, 2차원 및 3차원 기하학적 변환, 3차원 객체표현, 그래프 임베딩, 그래프 드로잉에 관련된 교차 그래프, 선분 그래프, Triangulated 그래프, Permutation그래프 등의 그래프 문제들에 대해서 살펴본다. 또한 그래픽과 관련된 여러 장치의 구조, 명령문을 연구하며 끝으로 Display 소프트웨어를 학습한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE431',
                         department=0,
                         type=2,
                         name='컴퓨터비전',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='컴퓨터비젼 시스템의 목표는 영상이나 연속 영상에서 실제 형태를 찾아내는 모델을 만드는 것이다. 컴퓨터비젼 시스템은 2차원으로 투영된 장면에서 3차원 주요 정보를 복원하는 것이다. 컴퓨터비젼 기술은 영상이미지에서 원격 센싱, 제품 검사에서 문서처리, 멀티미디어 데이터베이스에서의 검색 등에 적용된다. 본 강좌에서는 영상처리기술, 영상압축기술, 패턴 인식, 다양한 응용분야에 대하여 다룬다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE401',
                         department=0,
                         type=2,
                         name='인공지능컴퓨터시스템',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='인공지능의 발전을 뒷받침해주는 하드웨어 및 소프트웨어 시스템 주요 기술 및 기법을 다룬다. 1. 인공지능의 학습 관점에서 대량의 데이터 셋을 바탕으로 많은 양의 연산을 효과적으로 처리하기 위한 하드웨어 및 소프트웨어 기술 습득 2. 개발된 인공지능 모델이 실제 응용서비스에서 사용될 때 요구되는 컴퓨터 시스템 기술 습득',
                         prerequisite=[])

    await Courses.create(uuid='SCE413',
                         department=0,
                         type=2,
                         name='AI임베디드시스템',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='본 과목에서는 AI 임베디드 시스템의 구조 및 기본 요소와 AI 임베디드 시스템을 위해 적용되는 여러 엣지 컴퓨팅 기법 등을 학습한다. 또한 AI 임베디드 시스템을 위한 기본적인 개발 방법론과 여러 DNN 프레임워크 및 응용들을 학습함으로써, AI 프로세서 기반 임베디드 보드에서 실질적인 시스템을 개발할 수 있는 개발 능력을 배양하는 것을 목표로 한다. 본 과목에서는 다음과 같은 내용들을 다룬다. - Edge TPU 및 Nvidia Jetson 등 AI 임베디드 시스템 구조 및 기본 요소들 - 임베디드 시스템에서 활용되는 DNN 프레임워크 및 개발 방법 - AI 임베디드 시스템을 위한 엣지 컴퓨팅 기술 - AI 임베디드 시스템에서의 커널 프로그래밍 - Edge TPU 또는 Nvidia Jetson에서의 임베디드 프로그래밍',
                         prerequisite=[])

    await Courses.create(uuid='SCE414',
                         department=0,
                         type=2,
                         name='AIoT실시간서비스설계',
                         credit=3,
                         time=3,
                         grade=7,
                         summary='글로벌 팬데믹을 기점으로 모든 산업 영역의 디지털화 (Digital Transformation, DX)는 피할 수 없는 시대의 흐름이다. 특히 물류/산업기기 모니터링/제조업등에서는 IoT 기술과 AI를 접목하여 내/외부 변화에 대하여 기민하게 대응하는 지능형/실시간 서비스를 통해 비지니스 전반에 걸쳐 효율을 증가시키고 있다. 본 강의에서는 DX 혁신을 위한 기술적 요구사항을 알아보고 기존 사례를 통해 EDA (Event Driven Architecture) 기반 실시간 서비스 구축 방식에 대하여 알아본다. 이후, 아주대학교에 구축된 Solace PubSub+를 이용해 가상의 AIoT 실시간 응용서스를 Cloud 환경에서 설계 및 구현한다.',
                         prerequisite=[])


    # 4학년 2학기
    await Courses.create(uuid='SCE412',
                         department=0,
                         type=2,
                         name='고급컴퓨터구조',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='단일 프로세서의 성능을 향상시키기 위한 명령어 스케줄링 기법부터 다수의 프로세서를 가지는 멀티 프로세서 하드웨어 및 이를 활용하는 소프트웨어 구조와 원리에 대해서 학습한다. 멀티코어 프로세서로 인해서 기존의 메모리 계층 구조의 변화와 요구되는 프로그래밍 모델 등을 학습하고 이들을 돕기 위한 시스템 소프트웨어의 역할에 대해서도 살펴보도록 한다. 나아가 그래픽 프로세서를 통해서 HPC 및 AI 분야의 응용프로그램 성능 향상 기법에 대해서 학습하고 새로운 컴퓨팅 환경을 위해서 프로세서에서 어떤 변화가 일어나고 있는지 알아본다.',
                         prerequisite=["SCE212"])

    await Courses.create(uuid='SCE436',
                         department=0,
                         type=2,
                         name='인간과컴퓨터상호작용',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='본 과목은 인간과 컴퓨터간의 상호작용, 즉 Human Computer Interaction(HCI)에 관한 전반적인 이슈를 다룬다. 예를 들어, HCI 설계 원리, 사용자 편의성에 대한 인지적 모델링 및 평가 방법, GUI 혹은 가상현실과 같은 인터페이스 패러다임, 고성능 HCI 구현을 위한 상호작용 디바이스 및 구현 방법론, Java Swing 프로그래밍을 이용한 GUI 프로그래밍 기초에 관한 지식을 습득한다.',
                         prerequisite=["SCE231"])

    await Courses.create(uuid='SCE432',
                         department=0,
                         type=2,
                         name='인공지능',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='인공지능 전반에 대한 소개와 지식 표현, 추론, 학습 등을 중점적으로 배운다. 구체적으로 지식 기반 시스템, 온톨로지 구축 방법, 지능형 에이젼트를 영역지식에 따라 구축하는 방법 등을 배운다. 지식 구축 및 추론의 실습을 위하여 JESS의 사용법을 배우고 이를 이용하여 지식 기반 응용 시스템을 구축하는 프로젝트를 수행한다.',
                         prerequisite=["SCE205"])

    await Courses.create(uuid='SCE494',
                         department=0,
                         type=2,
                         name='자기주도연구2',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='대학원 진학을 희망하는 학생들이 대학원 진학 전 가능한 연구 분야를 탐색하고 본격적인 대학원 과정에서의 연구를 준비하는 단계에서의 자기주도적인 연구를 해 볼 수 있는 기회를 제공한다. 4학년 2학기 자기주도연구2와 연계하여 1년 동안 지도교수, 대학원생, 산업체 멘토와 연계하여 체계적이고 실용적인 연구를 진행한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE4910',
                         department=0,
                         type=2,
                         name='창업실습2',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='창업동아리 활동과 같은 창업 준비활동을 통해 학점을 이수하는 과정이다. 재학 중 창업현장실습과 통산하여 6학점 이내에서 수강하는 것을 원칙으로 한다. 교과목 수강을 희망하는 학생은 수강신청 전에 지원서를 학과장에게 제출하여 창업교육 학사제도 운영위원회의 심사를 거쳐 수강허가를 받아야 한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE4912',
                         department=0,
                         type=2,
                         name='창업현장실습2',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='창업을 하면서 학점을 이수하는 과정이다. 2학기 이상 이수자 중 정규 창업교육과정을 3학점 이상 이수한 학생에 한하여 수강하는 것을 원칙으로 한다. 재학 중 창업실습과 통산하여 6학점 이내에서 수강하는 것을 원칙으로 한다. 교과목수강을 희망하는 학생은 수강신청 전에 지원서를 학과장에게 제출하여 창업교육 학사제도 운영위원회의 심사를 거쳐 수강허가를 받아야 한다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE422',
                         department=0,
                         type=2,
                         name='AI통신네트워크',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='본 과목은 차세대통신(6G) 분야의 핵심인 인공지능 기반 통신네트워크 주제를 다룬다. 지도학습, 비지도학습, 강화학습 등 기계학습 알고리즘의 개요를 학습하고 이러한 알고리즘들이 다양한 통신 및 네트워크 이슈 (예: 자원관리, 무선라우팅, 네트워크 가상화 등)에 어떻게 적용될 수 있는지에 관하여 다룬다.',
                         prerequisite=[])

    await Courses.create(uuid='SCE415',
                         department=0,
                         type=2,
                         name='분산병렬컴퓨팅',
                         credit=3,
                         time=3,
                         grade=8,
                         summary='분산병렬컴퓨팅은 여러 연산(task or job)을 동시에 수행하여 대규모의 복잡한 컴퓨팅 문제를 해결하는 방법이며, 고성능 컴퓨팅 파워(High Performance Computing/High Throughput Computing)를 제공하기 위한 수단으로 사용되어 왔다. 최근 해결하고자 하는 문제의 크기와 복잡도가 기하급수적으로 커지고, HW 관점에서는 multicore 및 manycore 그리고 가속기의 적용이 일반화됨에 따라, 분산 병렬컴퓨팅의 필요성이 다시 중요해지고 있다. 본 과목에서는 분산병렬컴퓨팅의 이론, 프로그래밍 기법 및 응용사례를 학습한다. 또한, 분산병렬컴퓨팅 관련 프로그래밍 모델들(프로세스 기반의 Parallel Programming 모델인 MPI, 클라우드 컴퓨팅 및 빅데이터와 관련되어 활발히 활용되고 있는 MapReduce)을 기반으로 병렬알고리즘 구현 및 실제 데이터 처리 방법을 학습한다.',
                         prerequisite=[])

    print("Initialized!")


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(main())