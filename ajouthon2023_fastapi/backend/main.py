import uvicorn
from fastapi import FastAPI, Request
from course import Courses, setup

app = FastAPI()


@app.on_event("startup")
async def startup():
    await setup()


@app.get("/courses/{num}")
async def course(num: int):
    courses = []

    if num == 0:  # 소프트웨어학과
        courses = await Courses.all()

    return courses


@app.get("/course/find/{uuid}")
async def course_find(uuid: str):
    course = await Courses.filter(uuid=uuid)

    return course


if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", port=35241)