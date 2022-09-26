    const open1 = () => {
        document.querySelector(".modal1").classList.remove("hidden1");
      }

      const close1 = () => {
        document.querySelector(".modal1").classList.add("hidden1");
      }

      document.querySelector(".openBt").addEventListener("click", open1);
      document.querySelector(".closeBt").addEventListener("click", close1);
      document.querySelector(".bg1").addEventListener("click", close);