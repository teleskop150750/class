const teacher = document.querySelector("#teacher");
const selectDiscipline = document.querySelector("#selectDiscipline");
const selectGroup = document.querySelector("#selectGroup");
const add = document.querySelector("#add");

const date = document.querySelector("#date");
const desc = document.querySelector("#desc");
const studentsWrap = document.querySelector("#studentsWrap");

const tableHead = document.querySelector("#tableHead");
const tableBody = document.querySelector("#tableBody");
const tableFooter = document.querySelector("#tableFooter");

const dateUp = document.querySelector("#dateUp");
const update = document.querySelector("#update");
const studentsUpWrap = document.querySelector("#studentsUpWrap");

getDisciplines();
async function getDisciplines() {
  const data = teacher.textContent.trim();

  const response = await fetch("./getDisciplines.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(data),
  });
  const result = await response.json();

  let disciplinesHtml = "";
  for (let i = 0; i < result.length; i++) {
    disciplinesHtml += `<option value='${result[i]["discipline_name"]}'>${result[i]["discipline_name"]}</option>`;
  }
  selectDiscipline.innerHTML = "";
  selectDiscipline.innerHTML = disciplinesHtml;

  getGroups();
}

async function getGroups() {
  const data = {};
  data["discipline_name"] = selectDiscipline.value.trim();
  data["teacher_name"] = teacher.textContent.trim();

  const response = await fetch("./getGroups.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(data),
  });
  const result = await response.json();

  let groupsHtml = "";
  for (let i = 0; i < result.length; i++) {
    groupsHtml += `<option value='${result[i]["group_name"]}'>${result[i]["group_name"]}</option>`;
  }
  selectGroup.innerHTML = "";
  selectGroup.innerHTML = groupsHtml;

  getStudents();
}

async function getStudents() {
  const data = selectGroup.value.trim();

  const response = await fetch("./getStudents.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(data),
  });
  const result = await response.json();

  let html = "";
  for (let i = 0; i < result.length; i++) {
    html += `
      <div class='row d-flex align-items-end mb-3'>
        <div class='col-2'>
          <div class='alert alert-primary mb-0 student-name' role='alert'>${result[i]["student_name"]}</div>
        </div>
        <div class='col-2'>
          <input type='text' class='form-control lesson-mark' name='mark'>     
        </div>
      </div>
    `;
  }

  studentsWrap.innerHTML = "";
  studentsWrap.innerHTML = html;
  studentsUpWrap.innerHTML = "";
  dateUp.value = "";
  getTable();
}

function getTable() {
  getrHeadFooteTable();
  getMark();
}

async function getrHeadFooteTable() {
  const data = {};
  data["teacher_name"] = teacher.textContent.trim();
  data["discipline_name"] = selectDiscipline.value.trim();
  data["group_name"] = selectGroup.value.trim();

  const response = await fetch("./getTableHead.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(data),
  });
  const result = await response.json();

  let tableHeadHtml = '<th scope="col">Дата</th>';
  for (let i = 0; i < result.length; i++) {
    tableHeadHtml += `<th scope="col" style="white-space: nowrap;">${result[i]["lesson_date"]}</th>`;
  }

  tableHead.innerHTML = "";
  tableHead.innerHTML = tableHeadHtml;

  let tableFooterHtml = '<th scope="col">Тема</th>';
  for (let i = 0; i < result.length; i++) {
    tableFooterHtml += `<th scope="col">${result[i]["lesson_desc"]}</th>`;
  }

  tableFooter.innerHTML = "";
  tableFooter.innerHTML = tableFooterHtml;
}

async function getMark() {
  const data = {};
  data["teacher_name"] = teacher.textContent.trim();
  data["discipline_name"] = selectDiscipline.value.trim();
  data["group_name"] = selectGroup.value.trim();

  const studentsName = studentsWrap.querySelectorAll(".student-name");

  tableBody.innerHTML = "";
  let markHtml = "";
  for (let i = 0; i < studentsName.length; i++) {
    const studentName = studentsName[i];

    const student_name = studentName.textContent.trim();
    data["student_name"] = student_name;

    const response = await fetch("./getMark.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/json;charset=utf-8",
      },
      body: JSON.stringify(data),
    });
    const result = await response.json();
    markHtml += `<tr><th scope="col">${student_name}</th>`;
    for (let i = 0; i < result.length; i++) {
      markHtml += `<th scope="col">${result[i]["lesson_mark"]}</th>`;
    }
    markHtml += `</tr>`;
  }
  tableBody.insertAdjacentHTML("beforeend", markHtml);
}

selectDiscipline.addEventListener("change", getGroups);
selectGroup.addEventListener("change", getStudents);
add.addEventListener("click", async function () {
  // инфрмация об уроке
  const obj = {};
  obj["teacher_name"] = teacher.textContent.trim();
  obj["discipline_name"] = selectDiscipline.value.trim();
  obj["group_name"] = selectGroup.value.trim();
  obj["lesson_desc"] = desc.value.trim();
  obj["lesson_date"] = date.value;
  // -----------------------------------------------------------

  // имена студентов c оценками
  const studentsName = [...studentsWrap.querySelectorAll(".student-name")];
  const lessonMarks = [...studentsWrap.querySelectorAll(".lesson-mark")];
  const studentName_mark = [];
  for (let i = 0; i < studentsName.length; i++) {
    const obj = {};
    obj["student_name"] = studentsName[i].textContent.trim();
    obj["lesson_mark"] = lessonMarks[i].value.trim();
    studentName_mark.push(obj);
  }
  obj["student_name_mark"] = studentName_mark;
  // --------------------------------------

  response = await fetch("./setLesson.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(obj),
  });
  const result = await response.json();
  if (result > 0) {
    getTable();
  }
});

dateUp.addEventListener("change", async function () {
  const obj = {};
  obj["teacher_name"] = teacher.textContent.trim();
  obj["discipline_name"] = selectDiscipline.value.trim();
  obj["group_name"] = selectGroup.value.trim();
  obj["lesson_date"] = dateUp.value;

  response = await fetch("./getStudentsUp.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json;charset=utf-8",
    },
    body: JSON.stringify(obj),
  });

  const result = await response.json();
  let studentsHtml = "";

  for (let i = 0; i < result.length; i++) {
    studentsHtml += `
      <div class='row d-flex align-items-end mb-3'>
        <div class='col-2'>
          <div class='alert alert-primary mb-0 student-name' role='alert'>${result[i]["student_name"]}</div>
        </div>
        <div class='col-2'>
          <input type='text' class='form-control lesson-mark' name='mark' value="${result[i]["lesson_mark"]}">     
        </div>
      </div>
    `;
  }
  studentsUpWrap.innerHTML = "";
  studentsUpWrap.innerHTML = studentsHtml;
});

update.addEventListener("click", async function () {
  const studentsName = studentsUpWrap.querySelectorAll(".student-name");
  const marks = studentsUpWrap.querySelectorAll(".lesson-mark");
  const obj = {};
  obj["teacher_name"] = teacher.textContent.trim();
  obj["discipline_name"] = selectDiscipline.value.trim();
  obj["group_name"] = selectGroup.value.trim();
  obj["lesson_date"] = dateUp.value;

  let result = 0;

  for (let i = 0; i < studentsName.length; i++) {
    obj["student_name"] = studentsName[i].textContent.trim();
    obj["lesson_mark"] = marks[i].value.trim();
    console.log(obj);
    response = await fetch("./update.php", {
      method: "POST",
      headers: {
        "Content-Type": "application/json;charset=utf-8",
      },
      body: JSON.stringify(obj),
    });
    result += await response.json();
  }
  if (result > 0) {
    getTable();
  }
});
