# DefectResearcher

基于 Agnes Harness 的电缆缺陷科研实验工具。真实模型驱动的数据审计、独立几何验证、可信标签副本修复、同权重640/960验证集对照和漏检/误报诊断均已完成。两图本地真实业务恢复、受限跨工具CPU流程及其固定案例Agnes实测已验收；新实验自动执行、三组系统比较和完整科研自主性仍待完成。

2026年10月13日本轮完成AGH标题取消用量修复：122项AGH回归、128项诊断回归及TypeScript/本地构建通过。新V9来源拒绝样例初始工程10/10、业务19/19通过，4项原子声明有据，原输入未变，无修复副本；4主请求+1标题、34.139秒。但进程审计发现实测仍由旧daemon/worker运行，修改版执行来源验收失败并保留，不能计作修改版联合通过。现已用官方控制命令完整重启后台与网页并核实新进程/哈希；重启后新增模型请求0。原阶段保守容量46/48，剩2不足完整案例7；V8标题用量仍未知，历史闭合总数null。后续两分支补验建议另登记14请求，尚未执行。完整9/36比较、新实验闭环和最终交付仍待完成。见[本轮记录](outputs/comparison-pilot-v9/本轮推进与运行版本审计.md)。

此前V6正常人工样例C/U/F各一次诊断均通过，业务各19/19、12条声明有据。U/F各4主请求+1标题，阶段当时27/48；该结果保持。与本轮修复提示及更严预算不同，不能拼为同条件三组比较。见[V6验收](outputs/comparison-pilot-v6/接入诊断验收说明.md)。

2026年10月9日已实测完成真实 `agnes-3.0-flash` 模型驱动的首项审计，保存官方脱敏会话及对应产物。参见[开发进度](开发进度.md)和[证据复核](outputs/agh-first-audit/verification.json)。

截至2026年10月10日，第二项模型驱动验证已完成：4,479张图像、3,864框，0差异；30个冻结几何案例、45项测试均通过。参见[独立几何验证实测验收](outputs/agh-geometry-verification/验收说明.md)。

第三阶段本地验收：4正常、4实际修复、4拒绝共12例全部通过，53项回归测试通过；正式数据副本4,479图/3,864框核验通过，修改数0。参见[可信标签副本修复验收](outputs/labelguard-local-checks-20261010/验收说明.md)。

第三阶段真实Agnes验收已完成：修复工具启动1次、单次批准1次，最终修复及独立复验均passed；19项会话检查、14项独立复核通过，该阶段完整测试55项通过。正式标签和metadata修改数0；4种实际修复能力由隔离人工案例验证。参见[Agnes副本修复实测验收](outputs/agh-label-repair/验收说明.md)。

第四阶段完成同一640训练权重的640/960验证集实际对照：640图/596框，两次实际执行指标一致，89项回归测试及两次46项产物复核通过。Agnes实际启动并取得终态，最终数字摘要核验正确；严格全程工具范围检查27/29，模型尝试一次额外等待命令，审批守卫已拒绝并保留记录，不能称会话全部验收通过。参见[受控对照实测说明](outputs/agh-resolution-comparison/验收说明.md)。

第五阶段已完成专用会话的执行前守卫与真实Agnes诊断：1次启动、7次同任务查询、1次Allow once，31/31会话检查通过；本地与模型产物各61/61独立复核通过。参考365个FN中133个有同类低置信度达标候选；固定格子均未通过正常图误报预算，保留阈值停止结论。77个中等面积GT中52个空间候选FN支持下一项受控切片候选，极小4框支持量不足。参见[第五阶段实测说明](outputs/agh-diagnosis-model/验收说明.md)。

第六阶段保存产物的独立复核与新Agnes只读会话已完成：640图/596 GT、5760观察的99/99检查通过；真实模型一次固定任务读取、54/54验收及严格工具范围通过。固定切片候选应停止：mAP50由41.0688%降至27.8187%，FP149→2913，正常图误报5/245→223/245。原全群体计算在封存检查中失败，旧任务/两次产物复核失败及原预算均保留；新报告不追认原1800秒执行验收。此次新增检测推理0、模型读取发生真实推理。完整回归548项通过，详见[最新验收说明](outputs/agh-sliced-artifact-model-v3/验收说明.md)和[项目进度总览](项目进度总览.md)。

2026年10月12日已新增V3运行器、工作器、独立科学读取器和旁路状态读取，严格绑定参考`nms=null`；修复冷预测器续跑、预算恰好耗尽时的执行拒绝和单调时间下限。原七份执行代码、既有产物复核冻结代码及失败记录保留。新版本只完成无GPU工程验证，保留原640图/5760观察科学协议；原CLI/MCP入口仍使用旧版本，未接入新检测启动。参见[新运行器修复说明](outputs/sliced-runner-v3-fix/修复说明.md)。

2026年10月12日两图业务恢复V2本地真实验收通过：39次实际预测入口，复用2份检查点只补16次正式调用；GPU3.566秒、含Verifier与发布的总耗时13.281秒，低于共享40次/60秒/300秒预算。发布前后各67/67独立检查、816项回归通过。首轮V1因TorchVersion类型误判失败，23次实际调用及旧源码均保留；V2只规范版本元数据。该阶段未新增Agnes模型会话或MCP注册。见[实测说明](outputs/sliced-business-acceptance-v2/验收说明.md)，下一步为[受限跨工具研究流程](agent/下一阶段_受限跨工具研究流程.md)。

2026年10月12日受限跨工具研究流程V1本地验收17/17通过：12个冻结输入与5个预算边界场景，189/189验收检查、发布前后各178/178独立检查。正常、可信修复、来源拒绝与预算不足会改变实际工具路径；报告引用已核验证据，原期限过期不发布完成标记。原方案94个small与旧像素口径4个tiny分开复算；已停止的切片候选保持停止。新增检测、GPU与模型调用均为0，尚未接入新MCP服务。参见[验收说明](outputs/research-workflow-local-acceptance-v1/验收说明.md)和[接入提案](config/mcp-research-workflow-v1-proposal.json)。

2026年10月13日最新实测：Agnes一次启动并读取新人工修复任务，3次主流程模型请求、1次状态读取、1次Allow once，32.476秒内完成官方导出；独立模型验收23/23、历史保全9/9通过。新增运行器/时钟V2解决预算交接延长，原两轮失败保持不变；旧7工具保留，新独立2工具ready。领域控制器内部6次调用、外层模型3请求、新检测/GPU0；科学结论复用历史资料，候选保持停止。见[验收说明](outputs/agh-research-workflow-model-v3/验收说明.md)与[下一阶段三组比较草案](agent/下一阶段_三组系统比较协议草案.md)。

## 目录与来源

- `research_mcp_runtime_v2.py`、`research_mcp_server_v2.py`、`run_research_mcp_v2.py`：已接通的独立两工具服务，固定案例、不可复用任务ID与严格来源锁。
- `research_workflow_clock_v2.py`：沿用V1业务步骤，以可信原始双时钟计入交接耗时；原V1文件保留。
- `tools/verify_research_workflow_model_v2.py`：标准库独立核验官方会话、审批、预算、工作进程与最终科学摘要。

- `defect_researcher/research_workflow_v1.py`、`research_protocol_v1.py`、`research_domain_v1.py`、`research_science_v1.py`：本地控制器、共享预算、实际域工具适配与封存科学证据读取；不调用模型或检测器。
- `tools/verify_research_workflow_v1.py`：标准库独立重播状态、预算、输入、真实修复与报告引用，完成标记只在独立检查后发布。
- `tools/accept_research_workflow_v1.py`：17个场景的新目录验收；每次需新的请求前缀，不允许续用旧账本。

- `defect_researcher/audit.py`：包装现有 CableInspect 数据检查器，核验来源、验证集可访问性和冻结权重，并输出证据。
- `defect_researcher/mcp_server.py`：标准输入输出 MCP 服务，提供固定配置的数据审计、独立几何验证、副本修复和任务进度查询。
- `defect_researcher/task_runtime.py`：六类业务启动工具共享一个后台执行槽；读取完成结果前核验任务类型、最终标记、清单和必需产物，诊断另从已绑定预测复算结论，兼容已保存的旧任务。
- `defect_researcher/sliced_artifact_recovery.py`：以独立600秒预算核验已关闭失败任务的保存产物；原失败不变，新增检测/GPU为0。既有状态工具可读取该保存结果，不新增MCP启动工具。
- `defect_researcher/sliced_task_v3.py`、`sliced_worker_v3.py`：新执行版本，显式`nms=null`，预测前绑定固定来源、类型和源代码；保留原全验证集科学协议，尚无真实V3检测任务。
- `defect_researcher/sliced_runtime_v3.py`、`tools/inspect_sliced_runner_v3.py`：只读旁路，历史任务使用原读取路径，新任务要求明确V3协议与完整完成链；不注册MCP启动工具。
- `tools/verify_sliced_run_v3.py`：新执行版本的独立全群体科学读取器；不导入生产计算函数。
- `sliced_business_recovery_v2.py`、`sliced_business_worker_v2.py`与`tools/verify_sliced_business_recovery_v2.py`：两图专用协议、共享预算协调、已知成本故障恢复与独立业务Verifier；本地真实验收已通过，尚未注册MCP启动工具。
- `sliced_business_backend_v2.py`：仅规范Torch版本元数据的字符串表示，实际预测、FP32、CUDA、NMS等严格控制沿用冻结V3后端。
- `tools/verify_sliced_artifact_recovery.py`：绑定原独立科学核验源码，复算完整融合、三臂指标与日志，严格核对失败报告的nested evidence和完整来源链；保留99项检查。
- `defect_researcher/independent_geometry.py`：独立解析包络参考和固定 SHA256 的30个标准样例，不调用研究项目的几何模块。
- `defect_researcher/geometry_verifier.py`：逐条核对源COCO、YOLO标签和metadata，保存明细、来源清单和最终核验结论。
- `defect_researcher/label_repair.py`：先核验可信来源，以生产函数生成有依据的标签副本，再交给独立Verifier；依据不足时拒绝生成。
- `defect_researcher/resolution_comparison.py`：冻结同一640训练权重，只改变640/960推理尺寸；验证集图片本地推理，几何闸门与输入哈希通过后发布结果。
- `defect_researcher/detection_metrics.py`：独立实现置信度排序同类匹配及101点AP，保存固定操作点和图级配对分析。
- `defect_researcher/detection_diagnosis.py`：独立IoU与一对一匹配，生成GT/FP候选分类、尺寸/位置/类别统计、固定阈值曲线及条件分支。
- `defect_researcher/diagnosis_task.py`：绑定已封存对照任务，核验当前源输入和GT，在新目录发布诊断证据；不调用检测器。
- `fixtures/diagnosis_protocol.json`：查看诊断前冻结来源任务、阈值格子、误报预算与最低支持量。
- `tools/verify_diagnosis_run.py`：另写匹配与IoU的只读独立复核器，不导入诊断核心或原指标计算器。
- `defect_researcher/stratified_statistics.py`：分开按GT计算分层召回、按实际预测框计算分层precision；封存v1的尺寸/位置precision混用分母，弃用并由[补充勘误](outputs/diagnosis-stratified-correction/stratified_statistics.json)更正。
- `fixtures/resolution_protocol.json`：固定FP32、batch 1、阈值、设备与验证集范围，不接受模型修改。
- `fixtures/labelguard_cases.json`：预登记并固定SHA256的12个隔离人工案例，含手工标准答案。
- `tools/run_labelguard_acceptance.py`：实际执行完整12例修复/拒绝流程并比较固定答案。
- `tools/run_geometry_acceptance.py`：保存正常、改错坐标、忽略旋转、缺少输入的隔离验收记录；全部为人工构造数据。
- `config/example.json`：可迁移路径模板；相对路径以项目目录为基准。
- `config/local.json`：当前机器的路径配置，不含密钥，排除在发布代码之外。
- `agent/first_audit_task.md`：首个 AGH 任务。
- `agent/geometry_verification_task.md`：独立几何验证 AGH 任务。
- `outputs/`：每次运行的独立证据目录。
- `.runtime/agh/`：独立 AGH 会话与模型配置，排除在提交材料之外。

数据审计调用现有研究项目的 `数据处理/7检查YOLO标注数据.py`，数据来自 CableInspect-AD，检测权重来自现有 YOLO11n 基线。审计来源记录保存检查器、几何模块、数据清单、标注源、划分和权重的校验值。已有 checker 与转换器共享几何函数；新增独立 Verifier 使用本项目自己的解析参考和冻结标准答案。AGH 为 Apache-2.0 项目；第三方数据、权重和研究代码须在最终提交材料中分别说明来源和许可。

## 运行本地研究流程V1

在本机已配置环境中执行：

```powershell
conda activate MMIOC_env
Set-Location 'E:\PythonProject\AGH_\defect_researcher'
python -B -m defect_researcher.research_workflow_v1 --request config/research-workflow-v1.example.json
```

输入由[示例请求](config/research-workflow-v1.example.json)限定为12个冻结案例之一。报告生成于`outputs/research-workflow-v1-<request_id>/report.md`。重复运行前使用新的`request_id`，旧任务不能覆盖或重置预算；此入口仅运行本地CPU流程，不启动网页或Agnes。状态读取命令为`python -B -m defect_researcher.research_workflow_v1 --status outputs/research-workflow-v1-<request_id>`，完成任务会重新独立核验。

## 先运行工具

需要 Python 3.10 或以上；审计和 MCP 服务使用标准库，无需新装 Python 包。模型 Key 仅在 AGH 的本地 Provider 配置页面填写。

在本项目目录中使用已配置的 Python：

```powershell
python -B run.py paths
python -B run.py audit
python -B run.py verify
python -B run.py repair
python -B run.py compare
python -B run.py diagnose
python -B -m unittest discover -s tests -v
```

当前研究环境可执行文件为 `E:\Anaconda_envs\envs\MMIOC_env\python.exe`。迁移机器时复制 `config/example.json` 为 `config/local.json` 并修改研究项目、原始数据和权重路径。也可使用 `python -B run.py --config <配置路径> audit`。

成功运行会先保存审计结果、来源证据和事件，核验产物清单后最后发布 `completion.json`；失败保存错误和事件，不能产生成功完成标记。每次运行使用新任务目录，不覆盖原数据或历史研究结果。CLI 的 `audit` 同步完成；MCP 的 `audit_dataset` 立即返回任务编号，通过 `get_task_status` 查询进度和最终结果。本阶段可重新读取已完成结果；未完成任务在进程退出后判为中断，尚不包含业务任务恢复。

`verify` 使用独立的中心及旋转矩形解析宽高公式计算HBB，另核对有序角点、先旋转后裁剪、YOLO归一化和来源版本。源码、固定答案、COCO、划分、标签及metadata均做执行前后哈希；图片像素和权重不在此工具的读取范围。YOLO绝对容差为5.1e-9，像素容差为1e-8；真实官方舍入参考样例另在冻结JSON中显式记录容差。

验证工具的 `status=completed` 表示完整执行并保存产物；还必须检查 `summary.verification_status=passed` 才可报告核验通过。发现坐标或来源问题时结果仍可完整保存，但结论为 `failed`，CLI返回非零状态；缺少输入等执行异常则返回 `status=failed`。原始人工标注的真实性和检测性能不由几何一致性验证证明。

`repair`在全新任务目录生成独立标签及metadata副本，只修复可信COCO能够唯一确定的问题。正常语义一致的文件保留原始字节，图片仅建立硬链接而不读写像素；数据配置指向新副本。CLI仅在完整执行、`repair_status=passed`且独立`verification_status=passed`时成功退出；来源不足的`refused`保留为完整拒绝记录，无可使用副本。修改数0表示正常副本，不计作实际修复。

`compare` 使用现有 MMIOC_env 中的 PyTorch/Ultralytics/PyYAML 和 CUDA 0；无需新安装依赖。仅验证集推理，不重训、不自动降低batch或切换CPU。独立AP定义与历史Ultralytics不同；比较结论仅对当前验证集与单权重成立。原始输入只读，结果写入新outputs任务目录。参见[受控对照实测说明](outputs/agh-resolution-comparison/验收说明.md)。

`diagnose`复用冻结来源任务的640/960已保存预测，先核验完成链、输入哈希、验证集身份与源GT，再独立诊断。只在新outputs目录写结果；本轮没有新的检测推理、训练、测试集指标评估或阈值应用。CLI仅在`status=completed`且`summary.diagnosis_status=passed`时成功退出。当前来源任务由`fixtures/diagnosis_protocol.json`固定，迁移机器时必须先建立并验收等效来源，不能仅复制完成标记。其正常图误报预算保持参考5/245，是候选诊断约束；实际部署预算仍需确定。

## 在 AGH 中调用

先按 AGH 官方安装指南构建完整本地运行目录。`run_agh.py` 指向相邻 `agnes-harness/packages/cli/dist/local/agnes.mjs`，也接受 `--entry <绝对入口路径>`。所有命令使用本项目隔离的 `.runtime/agh` home 和官方内置 `local-dev` profile；当前 AGH 构建不支持任意新 profile 名称。

```powershell
.\start_web.ps1
```

当前 Windows 机器可用 `start_web.ps1` 在隐藏后台进程启动网页；需要完整重启后台和网页时使用 `.\tools\restart_agh_runtime_v1.ps1`；`.\start_web.ps1 -Restart`只重启网页入口。脚本只停止经入口、父进程和创建时间核验的本项目4177端口进程，日志保存在 `.runtime/`。需要在终端观察日志时，也可运行 `python -B run_agh.py serve`。

本机Provider和七项MCP工具已配置，启动后即可使用。迁移新环境时，在Provider页面填写Key、测试连接、选择模型并保存，随后注册工具服务：

```powershell
python -B run_agh.py mcp add defect-researcher --name defect-researcher --stdio <Python绝对路径> --arg -B --arg <本项目run.py绝对路径> --arg --config --arg <配置文件绝对路径> --arg mcp --allow-tool audit_dataset --allow-tool verify_label_geometry --allow-tool get_task_status
python -B run_agh.py mcp get defect-researcher
```

读取实际 revision 后依次 `mcp trust`、再次 `mcp get`、`mcp enable`；每次写操作使用最新 `--expected-revision`。当前服务已经注册、信任并启用，不需要重复添加。更新已启用服务时先 `mcp disable`，再以完整定义 `mcp update`，随后重新信任并启用；该AGH版本对已启用服务直接更新会因新版本尚未信任而回滚。每一步均先读取最新revision。

用 `mcp status defect-researcher`、`mcp tools defect-researcher` 核对连接与工具目录。上面的初始注册示例对应前三项工具；当前修复、对照及`diagnose_validation_errors`均已通过官方网页资源管理接口注册，七项工具连接ready，最新注册记录见`outputs/agh-sliced-registration/registration.json`；新增固定对照入口为`compare_validation_slices`。

专用诊断工作区`outputs/agh-diagnosis-model/workspace`已由受信公开插件强制限定一次诊断启动和最多20次同任务查询；其他工具和错误任务在执行前拒绝，写产物的Allow once保持有效。工具目录仍可见，普通工作区不受此专用策略约束。实际会话与策略详见[第五阶段实测说明](outputs/agh-diagnosis-model/验收说明.md)；守卫预算不跨Host重载持久化，不计作业务恢复。

启动审计或验证会写入新产物目录，需要在网页的60秒审批窗口内点击 `Allow once`。信任和启用MCP服务不等于批准该次工具执行。查询状态为只读操作。print模式不会替代网页中的单次批准，本次验证通过网页会话完成。

`audit_dataset` 返回 `running` 和 `task_id` 后，模型应使用同一编号调用 `get_task_status`，只有完整产物核验通过后才接受 `completed`。保存 AGH 官方会话导出和对应审计目录，才构成真实模型调用证据。独立 Python 审计和 MCP 通信测试只能分别证明工具和通信正确，不能替代这项验收。

## 仍待完成

跨工具研究闭环、同一任务的Agnes连续执行与最终科研报告、原方案三组系统比较、可复现提交包和实际演示仍待完成。固定切片候选已经停止；两图V2本地真实业务恢复已通过，但没有验收全640图或原方案640/960第二组评估故障场景。诊断分支由项目冻结规则计算，Agnes实际读取和解释；尚不能称模型自主提出和执行新实验。原对照会话27/29失败仍保留，后续诊断31/31与保存切片证据读取54/54分别通过。

2026年10月12日方案对照发现：原方案small为原图面积比<0.5%，实际统计small为面积<32²像素，分别覆盖94和4个GT，不能混用结论。保存预测的独立[口径附录](outputs/plan-alignment-review-20261012/补统计说明.md)已完成，原方案口径TP5/94→13/94（recall5.32%→13.83%），旧极小框0/4→0/4；总体AP下降、FP增加，须报告局部收益和代价。旧协议、统计、完成链与停止候选保持不变。优先收束第一版，见[参赛方案对照审查](参赛方案对照审查_20261012.md)及[下一阶段控制流程](agent/下一阶段_受限跨工具研究流程.md)。

参考：[参赛方案](../DefectResearcher_参赛项目方案.md)、[AGH 安装指南](../agnes-harness/docs/guide/install.zh-CN.md)、[AGH MCP 指南](../agnes-harness/docs/guide/mcp.zh-CN.md)、[MCP stdio 规范](https://modelcontextprotocol.io/specification/2024-11-05/basic/transports)。
